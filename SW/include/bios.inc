        brk_irq_mask = %00010000
        soft_vector_table = $300
        brk_soft_vector = soft_vector_table
        rtc_soft_vector = rtc_vector
        duart_soft_vector = duart_vector
        monitor_soft_vector = soft_vector_table + $a

initial_soft_vectors:
        .word   brk_irq
rtc_vector:
        .word   rtc_irq
duart_vector:
        .word   duart_irq
        n_soft_vectors = *-initial_soft_vectors

        in_buffer = $200
        out_buffer = $280

        extended_ascii_mask = %01111111
