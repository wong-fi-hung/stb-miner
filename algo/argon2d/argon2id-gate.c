// Bitweb. Argon2*id*, not argon2d — needs opt.c's next_addresses().

void argon2id1024_hash( void *output, const void *input )
{
   argon2_context context;
   context.out          = (uint8_t *)output;
   context.outlen       = (uint32_t)OUTPUT_BYTES;
   context.pwd          = (uint8_t *)input;
   context.pwdlen       = (uint32_t)INPUT_BYTES;
   context.salt         = (uint8_t *)input; //salt = input
   context.saltlen      = (uint32_t)INPUT_BYTES;
   context.secret       = NULL;
   context.secretlen    = 0;
   context.ad           = NULL;
   context.adlen        = 0;
   context.allocate_cbk = NULL;
   context.free_cbk     = NULL;
   // not DEFAULT_ARGON2_FLAG, which is 2 (CLEAR_SECRET) despite its comment
   context.flags        = ARGON2_DEFAULT_FLAGS;
   // main configurable Argon2 hash parameters
   context.m_cost       = 1024; // Memory in KiB (1MB)
   context.lanes        = 1;    // Degree of Parallelism
   context.threads      = 1;    // Threads
   context.t_cost       = 3;    // Iterations
   context.version      = ARGON2_VERSION_13;

   const int rc = argon2_ctx( &context, Argon2_id );
   if ( unlikely( rc != ARGON2_OK ) )
      applog( LOG_ERR, "argon2id1024_hash: argon2 error %d: %s",
              rc, argon2_error_message( rc ) );
}

static bool argon2id1024_self_test( void )
{
   uint32_t _ALIGN(64) hash[8];
   bool ok = true;

   // first, so a mistyped header reports itself instead of blaming Argon2
   sha256d( hash, argon2id1024_kat_header, 80 );
   if ( memcmp( hash, argon2id1024_kat_sha256d, 32 ) )
   {
      applog( LOG_ERR, "argon2id1024 self-test: KAT header is corrupt" );
      ok = false;
   }

   argon2id1024_hash( hash, argon2id1024_kat_header );
   if ( memcmp( hash, argon2id1024_kat_hash, 32 ) )
   {
      applog( LOG_ERR, "argon2id1024 self-test failed (block 76523)" );
      ok = false;
   }

   return ok;
}

bool register_argon2id1024_algo( algo_gate_t* gate )
{
        if ( !argon2id1024_self_test() ) return false;
        gate->scanhash = (void*)&scanhash_argon2d;
        gate->hash = (void*)&argon2id1024_hash;
        opt_target_factor = 65536.0;
        return true;
}
