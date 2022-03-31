#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(5*sizeof(Trans **));

	/* proctype 3: :init: */

	trans[3] = (Trans **) emalloc(39*sizeof(Trans *));

	T = trans[ 3][37] = settr(275,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(275,2,1,0,0,"ATOMIC", 1, 2, 0);
	trans[3][1]	= settr(239,2,2,3,3,"(run main_control())", 1, 2, 0);
	trans[3][2]	= settr(240,2,14,4,4,"proc = 0", 1, 2, 0);
	trans[3][15]	= settr(253,2,14,1,0,".(goto)", 1, 2, 0);
	T = trans[3][14] = settr(252,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(252,2,3,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(252,2,12,0,0,"DO", 1, 2, 0);
	trans[3][3]	= settr(241,2,10,5,5,"((proc<3))", 1, 2, 0); /* m: 4 -> 10,0 */
	reached3[4] = 1;
	trans[3][4]	= settr(0,0,0,0,0,"doors_status[proc].lower = 2",0,0,0);
	trans[3][5]	= settr(0,0,0,0,0,"doors_status[proc].higher = 2",0,0,0);
	trans[3][6]	= settr(0,0,0,0,0,"slide_status[proc].lower = 2",0,0,0);
	trans[3][7]	= settr(0,0,0,0,0,"slide_status[proc].higher = 2",0,0,0);
	trans[3][8]	= settr(0,0,0,0,0,"lock_water_level[proc] = 1",0,0,0);
	trans[3][9]	= settr(0,0,0,0,0,"lock_is_occupied[proc] = 0",0,0,0);
	trans[3][10]	= settr(248,2,11,6,6,"(run lock(proc))", 1, 2, 0);
	trans[3][11]	= settr(249,2,14,7,7,"proc = (proc+1)", 1, 2, 0);
	trans[3][12]	= settr(250,2,25,8,8,"((proc==3))", 1, 2, 0); /* m: 17 -> 25,0 */
	reached3[17] = 1;
	trans[3][13]	= settr(251,2,17,1,0,"goto :b8", 1, 2, 0); /* m: 17 -> 0,25 */
	reached3[17] = 1;
	trans[3][16]	= settr(254,2,17,1,0,"break", 1, 2, 0);
	trans[3][17]	= settr(255,2,25,9,9,"proc = 0", 1, 2, 0);
	trans[3][26]	= settr(264,2,25,1,0,".(goto)", 1, 2, 0);
	T = trans[3][25] = settr(263,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(263,2,18,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(263,2,23,0,0,"DO", 1, 2, 0);
	trans[3][18]	= settr(256,2,21,10,10,"((proc<5))", 1, 2, 0); /* m: 19 -> 21,0 */
	reached3[19] = 1;
	trans[3][19]	= settr(0,0,0,0,0,"ship_status[proc] = 3",0,0,0);
	trans[3][20]	= settr(0,0,0,0,0,"ship_pos[proc] = 0",0,0,0);
	trans[3][21]	= settr(259,2,22,11,11,"(run ship(proc))", 1, 2, 0);
	trans[3][22]	= settr(260,2,25,12,12,"proc = (proc+1)", 1, 2, 0);
	trans[3][23]	= settr(261,2,34,13,13,"((proc==5))", 1, 2, 0); /* m: 28 -> 34,0 */
	reached3[28] = 1;
	trans[3][24]	= settr(262,2,28,1,0,"goto :b9", 1, 2, 0); /* m: 28 -> 0,34 */
	reached3[28] = 1;
	trans[3][27]	= settr(265,2,28,1,0,"break", 1, 2, 0);
	trans[3][28]	= settr(266,2,34,14,14,"proc = 0", 1, 2, 0);
	trans[3][35]	= settr(273,2,34,1,0,".(goto)", 1, 2, 0);
	T = trans[3][34] = settr(272,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(272,2,29,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(272,2,32,0,0,"DO", 1, 2, 0);
	trans[3][29]	= settr(267,2,34,15,15,"((proc<5))", 1, 2, 0); /* m: 30 -> 34,0 */
	reached3[30] = 1;
	trans[3][30]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[proc]] = (nr_of_ships_at_pos[ship_pos[proc]]+1)",0,0,0);
	trans[3][31]	= settr(0,0,0,0,0,"proc = (proc+1)",0,0,0);
	trans[3][32]	= settr(270,2,33,2,0,"else", 1, 2, 0);
	trans[3][33]	= settr(271,2,36,1,0,"goto :b10", 1, 2, 0);
	trans[3][36]	= settr(274,0,38,1,0,"break", 1, 2, 0);
	trans[3][38]	= settr(276,0,0,16,16,"-end-", 0, 3500, 0);

	/* proctype 2: main_control */

	trans[2] = (Trans **) emalloc(80*sizeof(Trans *));

	trans[2][1]	= settr(160,0,76,17,17,"num = 0", 0, 2, 0);
	trans[2][77]	= settr(236,0,76,1,0,".(goto)", 0, 2, 0);
	T = trans[2][76] = settr(235,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(235,0,2,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(235,0,74,0,0,"DO", 0, 2, 0);
	trans[2][2]	= settr(161,0,70,18,0,"((num<3))", 0, 2, 0);
	trans[2][71]	= settr(230,0,70,1,0,".(goto)", 0, 2, 0);
	T = trans[2][70] = settr(229,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(229,0,34,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(229,0,67,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(229,0,68,0,0,"DO", 0, 2, 0);
	T = trans[ 2][34] = settr(193,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(193,2,3,0,0,"ATOMIC", 1, 2500, 0);
	trans[2][3]	= settr(162,2,9,19,19,"request_low[num]?1", 1, 2500, 0);
	T = trans[2][9] = settr(168,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(168,2,4,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(168,2,7,0,0,"IF", 1, 2500, 0);
	trans[2][4]	= settr(163,2,5,20,0,"((doors_status[num].higher==1))", 1, 2500, 0);
	trans[2][5]	= settr(164,2,6,21,21,"change_doors_pos[num]!1", 1, 2500, 0);
	trans[2][6]	= settr(165,2,16,22,22,"doors_pos_changed[num]?1", 1, 2500, 0);
	trans[2][10]	= settr(169,2,16,1,0,".(goto)", 1, 2500, 0);
	trans[2][7]	= settr(166,2,8,2,0,"else", 1, 2500, 0);
	trans[2][8]	= settr(167,2,16,1,0,"(1)", 1, 2500, 0);
	T = trans[2][16] = settr(175,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(175,2,11,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(175,2,14,0,0,"IF", 1, 2500, 0);
	trans[2][11]	= settr(170,2,12,23,0,"((slide_status[num].higher==1))", 1, 2500, 0);
	trans[2][12]	= settr(171,2,13,24,24,"change_slide_pos[num]!1", 1, 2500, 0);
	trans[2][13]	= settr(172,2,31,25,25,"slide_pos_changed[num]?1", 1, 2500, 0);
	trans[2][17]	= settr(176,2,31,1,0,".(goto)", 1, 2500, 0);
	trans[2][14]	= settr(173,2,15,2,0,"else", 1, 2500, 0);
	trans[2][15]	= settr(174,2,31,1,0,"(1)", 1, 2500, 0);
	T = trans[2][31] = settr(190,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(190,2,18,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(190,2,29,0,0,"IF", 1, 2500, 0);
	trans[2][18]	= settr(177,2,27,26,0,"((doors_status[num].lower==2))", 1, 2500, 0);
	T = trans[2][27] = settr(186,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(186,2,19,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(186,2,24,0,0,"IF", 1, 2500, 0);
	trans[2][19]	= settr(178,2,20,27,0,"(((lock_water_level[num]!=2)&&(slide_status[num].lower==2)))", 1, 2500, 0);
	trans[2][20]	= settr(179,2,21,28,28,"change_slide_pos[num]!2", 1, 2500, 0);
	trans[2][21]	= settr(180,2,22,29,29,"slide_pos_changed[num]?1", 1, 2500, 0);
	trans[2][22]	= settr(181,2,23,30,30,"change_doors_pos[num]!2", 1, 2500, 0);
	trans[2][23]	= settr(182,2,33,31,31,"doors_pos_changed[num]?1", 1, 2500, 0); /* m: 32 -> 33,0 */
	reached2[32] = 1;
	trans[2][28]	= settr(187,2,32,1,0,".(goto)", 1, 2500, 0); /* m: 32 -> 0,33 */
	reached2[32] = 1;
	trans[2][24]	= settr(183,2,25,32,0,"((lock_water_level[num]==2))", 1, 2500, 0);
	trans[2][25]	= settr(184,2,26,33,33,"change_doors_pos[num]!2", 1, 2500, 0);
	trans[2][26]	= settr(185,2,33,34,34,"doors_pos_changed[num]?1", 1, 2500, 0); /* m: 32 -> 33,0 */
	reached2[32] = 1;
	trans[2][32]	= settr(191,2,33,35,35,".(goto)", 1, 2500, 0);
	trans[2][29]	= settr(188,2,30,36,0,"((doors_status[num].lower==1))", 1, 2500, 0);
	trans[2][30]	= settr(189,2,33,37,37,"(1)", 1, 2500, 0); /* m: 32 -> 33,0 */
	reached2[32] = 1;
	trans[2][33]	= settr(192,0,70,38,38,"observed_low[num]?1", 1, 2500, 0);
	T = trans[ 2][67] = settr(226,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(226,2,35,0,0,"ATOMIC", 1, 2500, 0);
	trans[2][35]	= settr(194,2,41,39,39,"request_high[num]?1", 1, 2500, 0);
	T = trans[2][41] = settr(200,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(200,2,36,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(200,2,39,0,0,"IF", 1, 2500, 0);
	trans[2][36]	= settr(195,2,37,40,0,"((doors_status[num].lower==1))", 1, 2500, 0);
	trans[2][37]	= settr(196,2,38,41,41,"change_doors_pos[num]!2", 1, 2500, 0);
	trans[2][38]	= settr(197,2,48,42,42,"doors_pos_changed[num]?1", 1, 2500, 0);
	trans[2][42]	= settr(201,2,48,1,0,".(goto)", 1, 2500, 0);
	trans[2][39]	= settr(198,2,40,2,0,"else", 1, 2500, 0);
	trans[2][40]	= settr(199,2,48,1,0,"(1)", 1, 2500, 0);
	T = trans[2][48] = settr(207,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(207,2,43,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(207,2,46,0,0,"IF", 1, 2500, 0);
	trans[2][43]	= settr(202,2,44,43,0,"((slide_status[num].lower==1))", 1, 2500, 0);
	trans[2][44]	= settr(203,2,45,44,44,"change_slide_pos[num]!2", 1, 2500, 0);
	trans[2][45]	= settr(204,2,63,45,45,"slide_pos_changed[num]?1", 1, 2500, 0);
	trans[2][49]	= settr(208,2,63,1,0,".(goto)", 1, 2500, 0);
	trans[2][46]	= settr(205,2,47,2,0,"else", 1, 2500, 0);
	trans[2][47]	= settr(206,2,63,1,0,"(1)", 1, 2500, 0);
	T = trans[2][63] = settr(222,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(222,2,50,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(222,2,61,0,0,"IF", 1, 2500, 0);
	trans[2][50]	= settr(209,2,59,46,0,"((doors_status[num].higher==2))", 1, 2500, 0);
	T = trans[2][59] = settr(218,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(218,2,51,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(218,2,56,0,0,"IF", 1, 2500, 0);
	trans[2][51]	= settr(210,2,52,47,0,"(((lock_water_level[num]!=1)&&(slide_status[num].higher==2)))", 1, 2500, 0);
	trans[2][52]	= settr(211,2,53,48,48,"change_slide_pos[num]!1", 1, 2500, 0);
	trans[2][53]	= settr(212,2,54,49,49,"slide_pos_changed[num]?1", 1, 2500, 0);
	trans[2][54]	= settr(213,2,55,50,50,"change_doors_pos[num]!1", 1, 2500, 0);
	trans[2][55]	= settr(214,2,65,51,51,"doors_pos_changed[num]?1", 1, 2500, 0);
	trans[2][60]	= settr(219,2,65,1,0,".(goto)", 1, 2500, 0);
	trans[2][56]	= settr(215,2,57,52,0,"((lock_water_level[num]==1))", 1, 2500, 0);
	trans[2][57]	= settr(216,2,58,53,53,"change_doors_pos[num]!1", 1, 2500, 0);
	trans[2][58]	= settr(217,2,65,54,54,"doors_pos_changed[num]?1", 1, 2500, 0);
	trans[2][64]	= settr(223,2,65,1,0,".(goto)", 1, 2500, 0);
	trans[2][61]	= settr(220,2,62,55,0,"((doors_status[num].higher==1))", 1, 2500, 0);
	trans[2][62]	= settr(221,2,65,1,0,"(1)", 1, 2500, 0);
	trans[2][65]	= settr(224,0,76,56,56,"observed_high[num]?1", 1, 2500, 0); /* m: 66 -> 76,0 */
	reached2[66] = 1;
	trans[2][66]	= settr(225,0,73,1,0,"goto :b7", 1, 2500, 0); /* m: 73 -> 0,76 */
	reached2[73] = 1;
	trans[2][68]	= settr(227,0,73,2,0,"else", 0, 2, 0);
	trans[2][69]	= settr(228,0,73,1,0,"goto :b7", 0, 2, 0); /* m: 73 -> 0,76 */
	reached2[73] = 1;
	trans[2][72]	= settr(231,0,73,1,0,"break", 0, 2, 0);
	trans[2][73]	= settr(232,0,76,57,57,"num = (num+1)", 0, 2, 0);
	trans[2][74]	= settr(233,0,76,58,58,"((num==3))", 0, 2, 0); /* m: 75 -> 76,0 */
	reached2[75] = 1;
	trans[2][75]	= settr(0,0,0,0,0,"num = 0",0,0,0);
	trans[2][78]	= settr(237,0,79,1,0,"break", 0, 2, 0);
	trans[2][79]	= settr(238,0,0,59,59,"-end-", 0, 3500, 0);

	/* proctype 1: ship */

	trans[1] = (Trans **) emalloc(111*sizeof(Trans *));

	trans[1][108]	= settr(157,0,107,1,0,".(goto)", 0, 2, 0);
	T = trans[1][107] = settr(156,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(156,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(156,0,25,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(156,0,51,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(156,0,75,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(156,0,101,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(156,0,104,0,0,"DO", 0, 2, 0);
	trans[1][1]	= settr(50,0,22,60,0,"(((ship_status[shipid]==5)&&(ship_pos[shipid]!=0)))", 1, 2, 0);
	trans[1][23]	= settr(72,0,22,1,0,".(goto)", 0, 2, 0);
	T = trans[1][22] = settr(71,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(71,0,2,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(71,0,21,0,0,"DO", 0, 2, 0);
	trans[1][2]	= settr(51,0,3,61,0,"((doors_status[(ship_pos[shipid]-1)].higher==2))", 1, 2, 0);
	trans[1][3]	= settr(52,0,15,62,62,"request_high[(ship_pos[shipid]-1)]!1", 1, 4, 0);
	T = trans[ 1][15] = settr(64,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(64,2,4,0,0,"ATOMIC", 1, 6, 0);
	trans[1][4]	= settr(53,2,13,63,0,"((doors_status[(ship_pos[shipid]-1)].higher==1))", 1, 6, 0);
	T = trans[1][13] = settr(62,2,0,0,0,"IF", 1, 6, 0);
	T = T->nxt	= settr(62,2,5,0,0,"IF", 1, 6, 0);
	    T->nxt	= settr(62,2,11,0,0,"IF", 1, 6, 0);
	trans[1][5]	= settr(54,2,9,64,64,"(!(lock_is_occupied[(ship_pos[shipid]-1)]))", 1, 6, 0); /* m: 6 -> 9,0 */
	reached1[6] = 1;
	trans[1][6]	= settr(0,0,0,0,0,"ship_status[shipid] = 4",0,0,0);
	trans[1][7]	= settr(0,0,0,0,0,"lock_is_occupied[(ship_pos[shipid]-1)] = 1",0,0,0);
	trans[1][8]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]-1)",0,0,0);
	trans[1][9]	= settr(58,2,10,65,65,"observed_high[(ship_pos[shipid]-1)]!1", 1, 6, 0);
	trans[1][10]	= settr(59,0,107,1,0,"goto :b2", 1, 6, 0);
	trans[1][14]	= settr(63,0,22,1,0,".(goto)", 1, 6, 0);
	trans[1][11]	= settr(60,2,12,66,0,"(lock_is_occupied[(ship_pos[shipid]-1)])", 1, 6, 0);
	trans[1][12]	= settr(61,2,14,67,67,"observed_high[(ship_pos[shipid]-1)]!1", 1, 6, 0);
	T = trans[ 1][21] = settr(70,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(70,2,16,0,0,"ATOMIC", 1, 2, 0);
	trans[1][16]	= settr(65,4,107,68,68,"(((doors_status[(ship_pos[shipid]-1)].higher==1)&&!(lock_is_occupied[(ship_pos[shipid]-1)])))", 1, 2, 0); /* m: 17 -> 107,0 */
	reached1[17] = 1;
	trans[1][17]	= settr(0,0,0,0,0,"ship_status[shipid] = 4",0,0,0);
	trans[1][18]	= settr(0,0,0,0,0,"lock_is_occupied[(ship_pos[shipid]-1)] = 1",0,0,0);
	trans[1][19]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]-1)",0,0,0);
	trans[1][20]	= settr(69,0,107,1,0,"goto :b2", 1, 2, 0);
	trans[1][24]	= settr(73,0,107,1,0,"break", 0, 2, 0);
	trans[1][25]	= settr(74,0,48,69,0,"((ship_status[shipid]==4))", 1, 2, 0);
	trans[1][49]	= settr(98,0,48,1,0,".(goto)", 0, 2, 0);
	T = trans[1][48] = settr(97,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(97,0,26,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(97,0,47,0,0,"DO", 0, 2, 0);
	trans[1][26]	= settr(75,0,27,70,0,"((doors_status[(ship_pos[shipid]-1)].lower==2))", 1, 2, 0);
	trans[1][27]	= settr(76,0,40,71,71,"request_low[(ship_pos[shipid]-1)]!1", 1, 3, 0);
	T = trans[ 1][40] = settr(89,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(89,2,28,0,0,"ATOMIC", 1, 5, 0);
	trans[1][28]	= settr(77,2,38,72,0,"((doors_status[(ship_pos[shipid]-1)].lower==1))", 1, 5, 0);
	T = trans[1][38] = settr(87,2,0,0,0,"IF", 1, 5, 0);
	T = T->nxt	= settr(87,2,29,0,0,"IF", 1, 5, 0);
	    T->nxt	= settr(87,2,36,0,0,"IF", 1, 5, 0);
	trans[1][29]	= settr(78,2,34,73,73,"(((nr_of_ships_at_pos[(ship_pos[shipid]-1)]<2)||((ship_pos[shipid]-1)==0)))", 1, 5, 0); /* m: 30 -> 34,0 */
	reached1[30] = 1;
	trans[1][30]	= settr(0,0,0,0,0,"ship_status[shipid] = 5",0,0,0);
	trans[1][31]	= settr(0,0,0,0,0,"lock_is_occupied[(ship_pos[shipid]-1)] = 0",0,0,0);
	trans[1][32]	= settr(0,0,0,0,0,"ship_pos[shipid] = (ship_pos[shipid]-1)",0,0,0);
	trans[1][33]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]+1)",0,0,0);
	trans[1][34]	= settr(83,2,35,74,74,"observed_low[ship_pos[shipid]]!1", 1, 5, 0);
	trans[1][35]	= settr(84,0,107,1,0,"goto :b3", 1, 5, 0);
	trans[1][39]	= settr(88,0,48,1,0,".(goto)", 1, 5, 0);
	trans[1][36]	= settr(85,2,37,75,0,"(((nr_of_ships_at_pos[(ship_pos[shipid]-1)]==2)&&((ship_pos[shipid]-1)!=0)))", 1, 5, 0);
	trans[1][37]	= settr(86,2,39,76,76,"observed_low[(ship_pos[shipid]-1)]!1", 1, 5, 0);
	T = trans[ 1][47] = settr(96,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(96,2,41,0,0,"ATOMIC", 1, 2, 0);
	trans[1][41]	= settr(90,4,107,77,77,"(((doors_status[(ship_pos[shipid]-1)].lower==1)&&((nr_of_ships_at_pos[(ship_pos[shipid]-1)]<2)||((ship_pos[shipid]-1)==0))))", 1, 2, 0); /* m: 42 -> 107,0 */
	reached1[42] = 1;
	trans[1][42]	= settr(0,0,0,0,0,"ship_status[shipid] = 5",0,0,0);
	trans[1][43]	= settr(0,0,0,0,0,"lock_is_occupied[(ship_pos[shipid]-1)] = 0",0,0,0);
	trans[1][44]	= settr(0,0,0,0,0,"ship_pos[shipid] = (ship_pos[shipid]-1)",0,0,0);
	trans[1][45]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]+1)",0,0,0);
	trans[1][46]	= settr(95,0,107,1,0,"goto :b3", 1, 2, 0);
	trans[1][50]	= settr(99,0,107,1,0,"break", 0, 2, 0);
	trans[1][51]	= settr(100,0,72,78,0,"(((ship_status[shipid]==3)&&(ship_pos[shipid]!=3)))", 1, 2, 0);
	trans[1][73]	= settr(122,0,72,1,0,".(goto)", 0, 2, 0);
	T = trans[1][72] = settr(121,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(121,0,52,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(121,0,71,0,0,"DO", 0, 2, 0);
	trans[1][52]	= settr(101,0,53,79,0,"((doors_status[ship_pos[shipid]].lower==2))", 1, 2, 0);
	trans[1][53]	= settr(102,0,65,80,80,"request_low[ship_pos[shipid]]!1", 1, 3, 0);
	T = trans[ 1][65] = settr(114,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(114,2,54,0,0,"ATOMIC", 1, 5, 0);
	trans[1][54]	= settr(103,2,63,81,0,"((doors_status[ship_pos[shipid]].lower==1))", 1, 5, 0);
	T = trans[1][63] = settr(112,2,0,0,0,"IF", 1, 5, 0);
	T = T->nxt	= settr(112,2,55,0,0,"IF", 1, 5, 0);
	    T->nxt	= settr(112,2,61,0,0,"IF", 1, 5, 0);
	trans[1][55]	= settr(104,2,59,82,82,"(!(lock_is_occupied[ship_pos[shipid]]))", 1, 5, 0); /* m: 56 -> 59,0 */
	reached1[56] = 1;
	trans[1][56]	= settr(0,0,0,0,0,"ship_status[shipid] = 2",0,0,0);
	trans[1][57]	= settr(0,0,0,0,0,"lock_is_occupied[ship_pos[shipid]] = 1",0,0,0);
	trans[1][58]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]-1)",0,0,0);
	trans[1][59]	= settr(108,2,60,83,83,"observed_low[ship_pos[shipid]]!1", 1, 5, 0);
	trans[1][60]	= settr(109,0,107,1,0,"goto :b4", 1, 5, 0);
	trans[1][64]	= settr(113,0,72,1,0,".(goto)", 1, 5, 0);
	trans[1][61]	= settr(110,2,62,84,0,"(lock_is_occupied[ship_pos[shipid]])", 1, 5, 0);
	trans[1][62]	= settr(111,2,64,85,85,"observed_low[ship_pos[shipid]]!1", 1, 5, 0);
	T = trans[ 1][71] = settr(120,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(120,2,66,0,0,"ATOMIC", 1, 2, 0);
	trans[1][66]	= settr(115,4,107,86,86,"(((doors_status[ship_pos[shipid]].lower==1)&&!(lock_is_occupied[ship_pos[shipid]])))", 1, 2, 0); /* m: 67 -> 107,0 */
	reached1[67] = 1;
	trans[1][67]	= settr(0,0,0,0,0,"ship_status[shipid] = 2",0,0,0);
	trans[1][68]	= settr(0,0,0,0,0,"lock_is_occupied[ship_pos[shipid]] = 1",0,0,0);
	trans[1][69]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]-1)",0,0,0);
	trans[1][70]	= settr(119,0,107,1,0,"goto :b4", 1, 2, 0);
	trans[1][74]	= settr(123,0,107,1,0,"break", 0, 2, 0);
	trans[1][75]	= settr(124,0,98,87,0,"((ship_status[shipid]==2))", 1, 2, 0);
	trans[1][99]	= settr(148,0,98,1,0,".(goto)", 0, 2, 0);
	T = trans[1][98] = settr(147,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(147,0,76,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(147,0,97,0,0,"DO", 0, 2, 0);
	trans[1][76]	= settr(125,0,77,88,0,"((doors_status[ship_pos[shipid]].higher==2))", 1, 2, 0);
	trans[1][77]	= settr(126,0,90,89,89,"request_high[ship_pos[shipid]]!1", 1, 4, 0);
	T = trans[ 1][90] = settr(139,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(139,2,78,0,0,"ATOMIC", 1, 6, 0);
	trans[1][78]	= settr(127,2,88,90,0,"((doors_status[ship_pos[shipid]].higher==1))", 1, 6, 0);
	T = trans[1][88] = settr(137,2,0,0,0,"IF", 1, 6, 0);
	T = T->nxt	= settr(137,2,79,0,0,"IF", 1, 6, 0);
	    T->nxt	= settr(137,2,86,0,0,"IF", 1, 6, 0);
	trans[1][79]	= settr(128,2,84,91,91,"(((nr_of_ships_at_pos[(ship_pos[shipid]+1)]<2)||((ship_pos[shipid]+1)==3)))", 1, 6, 0); /* m: 80 -> 84,0 */
	reached1[80] = 1;
	trans[1][80]	= settr(0,0,0,0,0,"ship_status[shipid] = 3",0,0,0);
	trans[1][81]	= settr(0,0,0,0,0,"lock_is_occupied[ship_pos[shipid]] = 0",0,0,0);
	trans[1][82]	= settr(0,0,0,0,0,"ship_pos[shipid] = (ship_pos[shipid]+1)",0,0,0);
	trans[1][83]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]+1)",0,0,0);
	trans[1][84]	= settr(133,2,85,92,92,"observed_high[(ship_pos[shipid]-1)]!1", 1, 6, 0);
	trans[1][85]	= settr(134,0,107,1,0,"goto :b5", 1, 6, 0);
	trans[1][89]	= settr(138,0,98,1,0,".(goto)", 1, 6, 0);
	trans[1][86]	= settr(135,2,87,93,0,"(((nr_of_ships_at_pos[(ship_pos[shipid]+1)]==2)&&((ship_pos[shipid]+1)!=3)))", 1, 6, 0);
	trans[1][87]	= settr(136,2,89,94,94,"observed_high[ship_pos[shipid]]!1", 1, 6, 0);
	T = trans[ 1][97] = settr(146,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(146,2,91,0,0,"ATOMIC", 1, 2, 0);
	trans[1][91]	= settr(140,4,107,95,95,"(((doors_status[ship_pos[shipid]].higher==1)&&((nr_of_ships_at_pos[(ship_pos[shipid]+1)]<2)||((ship_pos[shipid]+1)==3))))", 1, 2, 0); /* m: 92 -> 107,0 */
	reached1[92] = 1;
	trans[1][92]	= settr(0,0,0,0,0,"ship_status[shipid] = 3",0,0,0);
	trans[1][93]	= settr(0,0,0,0,0,"lock_is_occupied[ship_pos[shipid]] = 0",0,0,0);
	trans[1][94]	= settr(0,0,0,0,0,"ship_pos[shipid] = (ship_pos[shipid]+1)",0,0,0);
	trans[1][95]	= settr(0,0,0,0,0,"nr_of_ships_at_pos[ship_pos[shipid]] = (nr_of_ships_at_pos[ship_pos[shipid]]+1)",0,0,0);
	trans[1][96]	= settr(145,0,107,1,0,"goto :b5", 1, 2, 0);
	trans[1][100]	= settr(149,0,107,1,0,"break", 0, 2, 0);
	trans[1][101]	= settr(150,0,102,96,0,"(((ship_status[shipid]==5)&&(ship_pos[shipid]==0)))", 1, 2, 0);
	trans[1][102]	= settr(151,0,103,97,97,"ship_status[shipid] = 1", 1, 2, 0);
	trans[1][103]	= settr(152,0,107,98,98,"ship_status[shipid] = 3", 1, 2, 0);
	trans[1][104]	= settr(153,0,105,99,0,"(((ship_status[shipid]==3)&&(ship_pos[shipid]==3)))", 1, 2, 0);
	trans[1][105]	= settr(154,0,106,100,100,"ship_status[shipid] = 1", 1, 2, 0);
	trans[1][106]	= settr(155,0,107,101,101,"ship_status[shipid] = 5", 1, 2, 0);
	trans[1][109]	= settr(158,0,110,1,0,"break", 0, 2, 0);
	trans[1][110]	= settr(159,0,0,102,102,"-end-", 0, 3500, 0);

	/* proctype 0: lock */

	trans[0] = (Trans **) emalloc(51*sizeof(Trans *));

	trans[0][48]	= settr(47,0,47,1,0,".(goto)", 0, 2, 0);
	T = trans[0][47] = settr(46,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(46,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(46,0,10,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(46,0,24,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(46,0,33,0,0,"DO", 0, 2, 0);
	trans[0][1]	= settr(0,0,7,103,103,"change_doors_pos[lockid]?2", 1, 507, 0);
	T = trans[0][7] = settr(6,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(6,0,2,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(6,0,5,0,0,"IF", 0, 2, 0);
	trans[0][2]	= settr(1,0,3,104,0,"((doors_status[lockid].lower==2))", 1, 2, 0);
	trans[0][3]	= settr(2,0,4,105,105,"doors_status[lockid].lower = 1", 1, 2, 0);
	trans[0][4]	= settr(3,0,9,106,106,"lock_water_level[lockid] = 2", 1, 2, 0);
	trans[0][8]	= settr(7,0,9,1,0,".(goto)", 0, 2, 0);
	trans[0][5]	= settr(4,0,6,107,0,"((doors_status[lockid].lower==1))", 1, 2, 0);
	trans[0][6]	= settr(5,0,9,108,108,"doors_status[lockid].lower = 2", 1, 2, 0);
	trans[0][9]	= settr(8,0,47,109,109,"doors_pos_changed[lockid]!1", 1, 8, 0);
	trans[0][10]	= settr(9,0,21,110,110,"change_doors_pos[lockid]?1", 1, 507, 0);
	T = trans[0][21] = settr(20,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(20,0,11,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(20,0,19,0,0,"IF", 0, 2, 0);
	trans[0][11]	= settr(10,0,12,111,0,"((doors_status[lockid].higher==2))", 1, 2, 0);
	trans[0][12]	= settr(11,0,17,112,112,"doors_status[lockid].higher = 1", 1, 2, 0);
	T = trans[0][17] = settr(16,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(16,0,13,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(16,0,15,0,0,"IF", 0, 2, 0);
	trans[0][13]	= settr(12,0,14,113,0,"(((doors_status[lockid].lower==2)&&(slide_status[lockid].lower==2)))", 1, 2, 0);
	trans[0][14]	= settr(13,0,23,114,114,"lock_water_level[lockid] = 1", 1, 2, 0);
	trans[0][18]	= settr(17,0,23,1,0,".(goto)", 0, 2, 0);
	trans[0][15]	= settr(14,0,16,115,0,"(((doors_status[lockid].lower==1)||(slide_status[lockid].lower==1)))", 1, 2, 0);
	trans[0][16]	= settr(15,0,23,1,0,"(1)", 0, 2, 0);
	trans[0][22]	= settr(21,0,23,1,0,".(goto)", 0, 2, 0);
	trans[0][19]	= settr(18,0,20,116,0,"((doors_status[lockid].higher==1))", 1, 2, 0);
	trans[0][20]	= settr(19,0,23,117,117,"doors_status[lockid].higher = 2", 1, 2, 0);
	trans[0][23]	= settr(22,0,47,118,118,"doors_pos_changed[lockid]!1", 1, 8, 0);
	trans[0][24]	= settr(23,0,30,119,119,"change_slide_pos[lockid]?2", 1, 509, 0);
	T = trans[0][30] = settr(29,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(29,0,25,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(29,0,28,0,0,"IF", 0, 2, 0);
	trans[0][25]	= settr(24,0,26,120,0,"((slide_status[lockid].lower==2))", 1, 2, 0);
	trans[0][26]	= settr(25,0,27,121,121,"slide_status[lockid].lower = 1", 1, 2, 0);
	trans[0][27]	= settr(26,0,32,122,122,"lock_water_level[lockid] = 2", 1, 2, 0);
	trans[0][31]	= settr(30,0,32,1,0,".(goto)", 0, 2, 0);
	trans[0][28]	= settr(27,0,29,123,0,"((slide_status[lockid].lower==1))", 1, 2, 0);
	trans[0][29]	= settr(28,0,32,124,124,"slide_status[lockid].lower = 2", 1, 2, 0);
	trans[0][32]	= settr(31,0,47,125,125,"slide_pos_changed[lockid]!1", 1, 10, 0);
	trans[0][33]	= settr(32,0,44,126,126,"change_slide_pos[lockid]?1", 1, 509, 0);
	T = trans[0][44] = settr(43,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(43,0,34,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(43,0,42,0,0,"IF", 0, 2, 0);
	trans[0][34]	= settr(33,0,35,127,0,"((slide_status[lockid].higher==2))", 1, 2, 0);
	trans[0][35]	= settr(34,0,40,128,128,"slide_status[lockid].higher = 1", 1, 2, 0);
	T = trans[0][40] = settr(39,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(39,0,36,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(39,0,38,0,0,"IF", 0, 2, 0);
	trans[0][36]	= settr(35,0,37,129,0,"(((doors_status[lockid].lower==2)&&(slide_status[lockid].lower==2)))", 1, 2, 0);
	trans[0][37]	= settr(36,0,46,130,130,"lock_water_level[lockid] = 1", 1, 2, 0);
	trans[0][41]	= settr(40,0,46,1,0,".(goto)", 0, 2, 0);
	trans[0][38]	= settr(37,0,39,131,0,"(((doors_status[lockid].lower==1)||(slide_status[lockid].lower==1)))", 1, 2, 0);
	trans[0][39]	= settr(38,0,46,1,0,"(1)", 0, 2, 0);
	trans[0][45]	= settr(44,0,46,1,0,".(goto)", 0, 2, 0);
	trans[0][42]	= settr(41,0,43,132,0,"((slide_status[lockid].higher==1))", 1, 2, 0);
	trans[0][43]	= settr(42,0,46,133,133,"slide_status[lockid].higher = 2", 1, 2, 0);
	trans[0][46]	= settr(45,0,47,134,134,"slide_pos_changed[lockid]!1", 1, 10, 0);
	trans[0][49]	= settr(48,0,50,1,0,"break", 0, 2, 0);
	trans[0][50]	= settr(49,0,0,135,135,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(3*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
