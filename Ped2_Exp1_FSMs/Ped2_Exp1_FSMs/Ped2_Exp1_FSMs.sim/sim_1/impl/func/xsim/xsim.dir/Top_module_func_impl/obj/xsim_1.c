/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_17(char*, char *);
IKI_DLLESPEC extern void execute_18(char*, char *);
IKI_DLLESPEC extern void execute_30(char*, char *);
IKI_DLLESPEC extern void execute_33(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_36(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_44(char*, char *);
IKI_DLLESPEC extern void execute_48(char*, char *);
IKI_DLLESPEC extern void execute_51(char*, char *);
IKI_DLLESPEC extern void execute_62(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_75(char*, char *);
IKI_DLLESPEC extern void execute_79(char*, char *);
IKI_DLLESPEC extern void execute_81(char*, char *);
IKI_DLLESPEC extern void execute_82(char*, char *);
IKI_DLLESPEC extern void execute_83(char*, char *);
IKI_DLLESPEC extern void execute_85(char*, char *);
IKI_DLLESPEC extern void execute_86(char*, char *);
IKI_DLLESPEC extern void execute_87(char*, char *);
IKI_DLLESPEC extern void execute_88(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void execute_91(char*, char *);
IKI_DLLESPEC extern void execute_142(char*, char *);
IKI_DLLESPEC extern void execute_147(char*, char *);
IKI_DLLESPEC extern void execute_242(char*, char *);
IKI_DLLESPEC extern void execute_247(char*, char *);
IKI_DLLESPEC extern void execute_252(char*, char *);
IKI_DLLESPEC extern void execute_255(char*, char *);
IKI_DLLESPEC extern void execute_258(char*, char *);
IKI_DLLESPEC extern void execute_261(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_88(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_89(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_90(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_91(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_92(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_93(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_103(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_104(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_105(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_106(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_107(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_108(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_109(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_110(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_115(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_117(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_121(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_123(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_125(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_127(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_128(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_159(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_210(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_218(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_226(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_234(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_242(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_250(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_258(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_266(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_274(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_282(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_290(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_298(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_306(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_314(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_322(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_330(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_338(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_346(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_354(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_362(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_370(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_378(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_386(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_394(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_402(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_410(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_418(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_426(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[95] = {(funcp)execute_17, (funcp)execute_18, (funcp)execute_30, (funcp)execute_33, (funcp)execute_35, (funcp)execute_36, (funcp)execute_37, (funcp)execute_44, (funcp)execute_48, (funcp)execute_51, (funcp)execute_62, (funcp)execute_64, (funcp)execute_65, (funcp)execute_70, (funcp)execute_75, (funcp)execute_79, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)execute_85, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_90, (funcp)execute_91, (funcp)execute_142, (funcp)execute_147, (funcp)execute_242, (funcp)execute_247, (funcp)execute_252, (funcp)execute_255, (funcp)execute_258, (funcp)execute_261, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_40, (funcp)transaction_41, (funcp)transaction_42, (funcp)transaction_51, (funcp)transaction_59, (funcp)transaction_72, (funcp)transaction_80, (funcp)transaction_88, (funcp)transaction_89, (funcp)transaction_90, (funcp)transaction_91, (funcp)transaction_92, (funcp)transaction_93, (funcp)transaction_94, (funcp)transaction_103, (funcp)transaction_104, (funcp)transaction_105, (funcp)transaction_106, (funcp)transaction_107, (funcp)transaction_108, (funcp)transaction_109, (funcp)transaction_110, (funcp)transaction_111, (funcp)transaction_115, (funcp)transaction_117, (funcp)transaction_119, (funcp)transaction_121, (funcp)transaction_123, (funcp)transaction_125, (funcp)transaction_127, (funcp)transaction_128, (funcp)transaction_159, (funcp)transaction_210, (funcp)transaction_218, (funcp)transaction_226, (funcp)transaction_234, (funcp)transaction_242, (funcp)transaction_250, (funcp)transaction_258, (funcp)transaction_266, (funcp)transaction_274, (funcp)transaction_282, (funcp)transaction_290, (funcp)transaction_298, (funcp)transaction_306, (funcp)transaction_314, (funcp)transaction_322, (funcp)transaction_330, (funcp)transaction_338, (funcp)transaction_346, (funcp)transaction_354, (funcp)transaction_362, (funcp)transaction_370, (funcp)transaction_378, (funcp)transaction_386, (funcp)transaction_394, (funcp)transaction_402, (funcp)transaction_410, (funcp)transaction_418, (funcp)transaction_426};
const int NumRelocateId= 95;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Top_module_func_impl/xsim.reloc",  (void **)funcTab, 95);
	iki_vhdl_file_variable_register(dp + 96768);
	iki_vhdl_file_variable_register(dp + 96824);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Top_module_func_impl/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Top_module_func_impl/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/Top_module_func_impl/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Top_module_func_impl/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Top_module_func_impl/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
