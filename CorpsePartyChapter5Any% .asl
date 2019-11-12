// Made by Yuuya94
state("CorpseParty")
{
	int button_pointer : 0x32F054;
	int startchapter_1 : 0x2009534;
	int startchapter_2 : 0x12D3544;
	int startchapter_3 : 0x1633198;
	int end_chapter : 0x12A6B58;
}

init{
	vars.nb_split = 0;
}

start
{
	if ((current.startchapter_1 == 0 && current.startchapter_2 == 0 && current.startchapter_3 == 0) && current.button_pointer == 53) {
		vars.nb_split = 0;
		return true;
	}
}

split
{
	if(vars.nb_split<500){
		vars.nb_split++;
	}
	if(current.end_chapter == 1 && vars.nb_split==500){
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
