var z=0;
repeat(9) {
	
}
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_SQUARE);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_L45);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_LCS2);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_LCS1);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, u, u, u, c_spikelogic);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, u, u, u, c_spikelogic);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, u, u, u, c_spikelogic);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, u, u, u, c_spikelogic);

function c_spikelogic() {
	df.spd.h = -2;
	df.spd.v = -2;
}