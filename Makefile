# Block descriptor for the cvfpu floating-point unit (vendor-owned).
# Compiled as a standalone block; rtl/fabric/fu/elem depends on it via DEPS.

REPO_ROOT ?= $(shell git rev-parse --show-superproject-working-tree)

BLOCK := extern/cvfpu

SRCS.sim := \
    src/common_cells/src/binary_to_gray.sv \
    src/common_cells/src/cb_filter_pkg.sv \
    src/common_cells/src/cc_onehot.sv \
    src/common_cells/src/cdc_reset_ctrlr_pkg.sv \
    src/common_cells/src/cf_math_pkg.sv \
    src/common_cells/src/clk_int_div.sv \
    src/common_cells/src/credit_counter.sv \
    src/common_cells/src/delta_counter.sv \
    src/common_cells/src/ecc_pkg.sv \
    src/common_cells/src/edge_propagator_tx.sv \
    src/common_cells/src/exp_backoff.sv \
    src/common_cells/src/fifo_v3.sv \
    src/common_cells/src/gray_to_binary.sv \
    src/common_cells/src/isochronous_4phase_handshake.sv \
    src/common_cells/src/isochronous_spill_register.sv \
    src/common_cells/src/lfsr.sv \
    src/common_cells/src/lfsr_16bit.sv \
    src/common_cells/src/lfsr_8bit.sv \
    src/common_cells/src/lossy_valid_to_stream.sv \
    src/common_cells/src/mv_filter.sv \
    src/common_cells/src/onehot_to_bin.sv \
    src/common_cells/src/plru_tree.sv \
    src/common_cells/src/passthrough_stream_fifo.sv \
    src/common_cells/src/popcount.sv \
    src/common_cells/src/rr_arb_tree.sv \
    src/common_cells/src/rstgen_bypass.sv \
    src/common_cells/src/serial_deglitch.sv \
    src/common_cells/src/shift_reg.sv \
    src/common_cells/src/shift_reg_gated.sv \
    src/common_cells/src/spill_register_flushable.sv \
    src/common_cells/src/stream_demux.sv \
    src/common_cells/src/stream_filter.sv \
    src/common_cells/src/stream_fork.sv \
    src/common_cells/src/stream_intf.sv \
    src/common_cells/src/stream_join_dynamic.sv \
    src/common_cells/src/stream_mux.sv \
    src/common_cells/src/stream_throttle.sv \
    src/common_cells/src/sub_per_hash.sv \
    src/common_cells/src/sync.sv \
    src/common_cells/src/sync_wedge.sv \
    src/common_cells/src/unread.sv \
    src/common_cells/src/read.sv \
    src/common_cells/src/addr_decode_dync.sv \
    src/common_cells/src/cdc_2phase.sv \
    src/common_cells/src/cdc_4phase.sv \
    src/common_cells/src/clk_int_div_static.sv \
    src/common_cells/src/addr_decode.sv \
    src/common_cells/src/addr_decode_napot.sv \
    src/common_cells/src/multiaddr_decode.sv \
    src/common_cells/src/cb_filter.sv \
    src/common_cells/src/cdc_fifo_2phase.sv \
    src/common_cells/src/clk_mux_glitch_free.sv \
    src/common_cells/src/counter.sv \
    src/common_cells/src/ecc_decode.sv \
    src/common_cells/src/ecc_encode.sv \
    src/common_cells/src/edge_detect.sv \
    src/common_cells/src/lzc.sv \
    src/common_cells/src/max_counter.sv \
    src/common_cells/src/rstgen.sv \
    src/common_cells/src/spill_register.sv \
    src/common_cells/src/stream_delay.sv \
    src/common_cells/src/stream_fifo.sv \
    src/common_cells/src/stream_fork_dynamic.sv \
    src/common_cells/src/stream_join.sv \
    src/common_cells/src/cdc_reset_ctrlr.sv \
    src/common_cells/src/cdc_fifo_gray.sv \
    src/common_cells/src/fall_through_register.sv \
    src/common_cells/src/id_queue.sv \
    src/common_cells/src/stream_to_mem.sv \
    src/common_cells/src/stream_arbiter_flushable.sv \
    src/common_cells/src/stream_fifo_optimal_wrap.sv \
    src/common_cells/src/stream_register.sv \
    src/common_cells/src/stream_xbar.sv \
    src/common_cells/src/cdc_fifo_gray_clearable.sv \
    src/common_cells/src/cdc_2phase_clearable.sv \
    src/common_cells/src/mem_to_banks_detailed.sv \
    src/common_cells/src/stream_arbiter.sv \
    src/common_cells/src/stream_omega_net.sv \
    src/common_cells/src/mem_to_banks.sv \
    src/common_cells/src/edge_propagator_ack.sv \
    src/common_cells/src/edge_propagator.sv \
    src/common_cells/src/edge_propagator_rx.sv \
    src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/control_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv \
    src/fpu_div_sqrt_mvp/hdl/div_sqrt_mvp_wrapper.sv \
    src/fpnew_pkg.sv \
    src/fpnew_cast_multi.sv \
    src/fpnew_classifier.sv \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/clk/rtl/gated_clk_cell.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_ctrl.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_ff1.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_pack_single.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_prepare.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_round_single.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_special.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_srt_single.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_top.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_dp.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_frbus.v \
    vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_src_type.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_ctrl.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_double.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_ff1.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_pack.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_prepare.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_round.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_scalar_dp.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_srt_radix16_bound_table.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_srt_radix16_with_sqrt.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_srt.v \
    vendor/openc910/C910_RTL_FACTORY/gen_rtl/vfdsu/rtl/ct_vfdsu_top.v \
    src/fpnew_divsqrt_th_32.sv \
    src/fpnew_divsqrt_th_64_multi.sv \
    src/fpnew_divsqrt_multi.sv \
    src/fpnew_fma.sv \
    src/fpnew_fma_multi.sv \
    src/fpnew_noncomp.sv \
    src/fpnew_opgroup_block.sv \
    src/fpnew_opgroup_fmt_slice.sv \
    src/fpnew_opgroup_multifmt_slice.sv \
    src/fpnew_rounding.sv \
    src/fpnew_top.sv

DEPS :=
FLOW_EXTRA_LIBS :=

# Include dirs (repo-root-relative).
BLOCK_INCDIRS += \
    extern/cvfpu/src \
    extern/cvfpu/src/common_cells/src \
    extern/cvfpu/src/common_cells/include \
    extern/cvfpu/src/fpu_div_sqrt_mvp/hdl

include $(REPO_ROOT)/Makefile.block
