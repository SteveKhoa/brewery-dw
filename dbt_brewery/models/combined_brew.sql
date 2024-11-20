
-- Step 1: Create intermediate tables
WITH
  intermediate_brew_1 AS (
    SELECT * FROM brew_part_aa
    UNION ALL
    SELECT * FROM brew_part_ab
    UNION ALL
    SELECT * FROM brew_part_ac
    UNION ALL
    SELECT * FROM brew_part_ad
    UNION ALL
    SELECT * FROM brew_part_ae
    UNION ALL
    SELECT * FROM brew_part_af
    UNION ALL
    SELECT * FROM brew_part_ag
    UNION ALL
    SELECT * FROM brew_part_ah
    UNION ALL
    SELECT * FROM brew_part_ai
    UNION ALL
    SELECT * FROM brew_part_aj
  ),
  intermediate_brew_2 AS (
    SELECT * FROM brew_part_ak
    UNION ALL
    SELECT * FROM brew_part_al
    UNION ALL
    SELECT * FROM brew_part_am
    UNION ALL
    SELECT * FROM brew_part_an
    UNION ALL
    SELECT * FROM brew_part_ao
    UNION ALL
    SELECT * FROM brew_part_ap
    UNION ALL
    SELECT * FROM brew_part_aq
    UNION ALL
    SELECT * FROM brew_part_ar
    UNION ALL
    SELECT * FROM brew_part_as
    UNION ALL
    SELECT * FROM brew_part_at
  ),
  intermediate_brew_3 AS (
    SELECT * FROM brew_part_au
    UNION ALL
    SELECT * FROM brew_part_av
    UNION ALL
    SELECT * FROM brew_part_aw
    UNION ALL
    SELECT * FROM brew_part_ax
    UNION ALL
    SELECT * FROM brew_part_ay
    UNION ALL
    SELECT * FROM brew_part_az
    UNION ALL
    SELECT * FROM brew_part_ba
    UNION ALL
    SELECT * FROM brew_part_bb
    UNION ALL
    SELECT * FROM brew_part_bc
    UNION ALL
    SELECT * FROM brew_part_bd
  ),
  intermediate_brew_4 AS (
    SELECT * FROM brew_part_be
    UNION ALL
    SELECT * FROM brew_part_bf
    UNION ALL
    SELECT * FROM brew_part_bg
    UNION ALL
    SELECT * FROM brew_part_bh
    UNION ALL
    SELECT * FROM brew_part_bi
    UNION ALL
    SELECT * FROM brew_part_bj
    UNION ALL
    SELECT * FROM brew_part_bk
    UNION ALL
    SELECT * FROM brew_part_bl
    UNION ALL
    SELECT * FROM brew_part_bm
    UNION ALL
    SELECT * FROM brew_part_bn
  ),
  intermediate_brew_5 AS (
    SELECT * FROM brew_part_bo
    UNION ALL
    SELECT * FROM brew_part_bp
    UNION ALL
    SELECT * FROM brew_part_bq
    UNION ALL
    SELECT * FROM brew_part_br
    UNION ALL
    SELECT * FROM brew_part_bs
    UNION ALL
    SELECT * FROM brew_part_bt
    UNION ALL
    SELECT * FROM brew_part_bu
    UNION ALL
    SELECT * FROM brew_part_bv
    UNION ALL
    SELECT * FROM brew_part_bw
    UNION ALL
    SELECT * FROM brew_part_bx
  ),
  intermediate_brew_6 AS (
    SELECT * FROM brew_part_by
    UNION ALL
    SELECT * FROM brew_part_bz
    UNION ALL
    SELECT * FROM brew_part_ca
    UNION ALL
    SELECT * FROM brew_part_cb
    UNION ALL
    SELECT * FROM brew_part_cc
    UNION ALL
    SELECT * FROM brew_part_cd
    UNION ALL
    SELECT * FROM brew_part_ce
    UNION ALL
    SELECT * FROM brew_part_cf
    UNION ALL
    SELECT * FROM brew_part_cg
    UNION ALL
    SELECT * FROM brew_part_ch
  ),
  intermediate_brew_7 AS (
    SELECT * FROM brew_part_ci
    UNION ALL
    SELECT * FROM brew_part_cj
    UNION ALL
    SELECT * FROM brew_part_ck
    UNION ALL
    SELECT * FROM brew_part_cl
    UNION ALL
    SELECT * FROM brew_part_cm
    UNION ALL
    SELECT * FROM brew_part_cn
    UNION ALL
    SELECT * FROM brew_part_co
    UNION ALL
    SELECT * FROM brew_part_cp
    UNION ALL
    SELECT * FROM brew_part_cq
    UNION ALL
    SELECT * FROM brew_part_cr
  ),
  intermediate_brew_8 AS (
    SELECT * FROM brew_part_cs
    UNION ALL
    SELECT * FROM brew_part_ct
    UNION ALL
    SELECT * FROM brew_part_cu
    UNION ALL
    SELECT * FROM brew_part_cv
    UNION ALL
    SELECT * FROM brew_part_cw
    UNION ALL
    SELECT * FROM brew_part_cx
    UNION ALL
    SELECT * FROM brew_part_cy
    UNION ALL
    SELECT * FROM brew_part_cz
  )

-- Step 2: Combine the intermediate tables into the final table
SELECT * FROM intermediate_brew_1
UNION ALL
SELECT * FROM intermediate_brew_2
UNION ALL
SELECT * FROM intermediate_brew_3
UNION ALL
SELECT * FROM intermediate_brew_4
UNION ALL
SELECT * FROM intermediate_brew_5
UNION ALL
SELECT * FROM intermediate_brew_6
UNION ALL
SELECT * FROM intermediate_brew_7
UNION ALL
SELECT * FROM intermediate_brew_8

