#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define BLAKE2S_BLOCK_SIZE 64
#define BLAKE2S_BLOCK_SIZE 64
#define PAGE_SIZE 4096
#define BLAKE2S_HASH_SIZE 32

#define u8 char
#define u32 int

enum blake2s_iv {
	BLAKE2S_IV0 = 0x6A09E667UL,
	BLAKE2S_IV1 = 0xBB67AE85UL,
	BLAKE2S_IV2 = 0x3C6EF372UL,
	BLAKE2S_IV3 = 0xA54FF53AUL,
	BLAKE2S_IV4 = 0x510E527FUL,
	BLAKE2S_IV5 = 0x9B05688CUL,
	BLAKE2S_IV6 = 0x1F83D9ABUL,
	BLAKE2S_IV7 = 0x5BE0CD19UL,
};

struct blake2s_state {
	/* 'h', 't', and 'f' are used in assembly code, so keep them as-is. */
	u32 h[8];
	u32 t[2];
	u32 f[2];
	u8 buf[BLAKE2S_BLOCK_SIZE];
	unsigned int buflen;
	unsigned int outlen;
};
static struct {
	struct blake2s_state hash;
	/*spinlock_t*/ size_t lock;
	unsigned int init_bits;
} input_pool = {
	.hash.h = { BLAKE2S_IV0 ^ (0x01010000 | BLAKE2S_HASH_SIZE),
		    BLAKE2S_IV1, BLAKE2S_IV2, BLAKE2S_IV3, BLAKE2S_IV4,
		    BLAKE2S_IV5, BLAKE2S_IV6, BLAKE2S_IV7 },
	.hash.outlen = BLAKE2S_HASH_SIZE,
	//.lock = __SPIN_LOCK_UNLOCKED(input_pool.lock),
};


void blake2s_update(struct blake2s_state *state, const u8 *in, size_t inlen /* 0x40 */)
{
    const size_t fill = BLAKE2S_BLOCK_SIZE /* 0x40 */ - state->buflen;

    // [...]
    if (inlen > fill) {
        memcpy(state->buf + state->buflen, in, fill);
        //blake2s_compress(state, state->buf, 1, BLAKE2S_BLOCK_SIZE); // [10]
        state->buflen = 0;
        in += fill;
        inlen -= fill;
    }
    // [...]
    memcpy(state->buf + state->buflen, in, inlen);
    state->buflen += inlen;

}


static void _mix_pool_bytes(const void *buf, size_t len)
{
    blake2s_update(&input_pool.hash, buf, len /* 0x40 */); // [9]
}
static void mix_pool_bytes(const void *buf, size_t len)
{
    unsigned long flags;

    // [...]
    _mix_pool_bytes(buf, len /* 0x40 */); // <-----------
    // [...]
}
static ssize_t write_pool_user(/*struct iov_iter*/ char *iter)
{
    u8 block[BLAKE2S_BLOCK_SIZE /* 64 */];
    ssize_t ret = 0;
    size_t copied;

    // [...]
    for (;;) {
        //copied = copy_from_iter(block, sizeof(block), iter); // [6]
        copied = memcpy(block, iter, sizeof(block));
        ret += copied;
        mix_pool_bytes(block, copied);
        // [...]
        if (!iov_iter_count(iter) || copied != sizeof(block)) // [7]
            break;

        if (ret % PAGE_SIZE == 0) {
            //if (signal_pending(current)) // [8]
            //    break;
            //cond_resched();
        }
    }
    // [...]
}

static ssize_t random_write_iter(struct kiocb *kiocb, /*struct iov_iter*/ char *iter)
{
    return write_pool_user(iter); // [5]
}
void entry0(int cmd, char user_input){
    char con[0x100];
    copy_from_user(con, &cmd, 0x100);
    random_write_iter(0LL, con);
}

int main(){
    entry0(1, 1);
}