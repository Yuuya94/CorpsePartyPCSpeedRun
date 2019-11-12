// Made by Yuuya94
state("CorpseParty")
{
	int button_pointer : 0x32F054;
	int startchapter1 : 0x2009534;
	int startchapter2 : 0x12D3544;
	int startchapter3 : 0x1633198;
	int test : 0x55E2E8;
	int end_chapter : 0x166F5BC;
}

init{
	vars.nb_split = 0;
}

start
{
	if ((current.startchapter1 == 0 && current.startchapter2 == 0 && current.startchapter3 == 0) && current.button_pointer == 51) {
		vars.nb_split = 0;
		return true;
	}
}

split
{
	if(vars.nb_split<500){
		vars.nb_split++;
	}
	if(current.test == 36 && current.end_chapter == 1 && vars.nb_split==500){
		vars.nb_split++;
		return true;
	}
}
reset
{
	if (current.button_pointer == 101 && current.end_chapter==0){
		vars.nb_split=0;
		return true;
	}
}
