// Made by Yuuya94
state("CorpseParty")
{
	int button_pointer : 0x32F054;
	int startchapter_1 : 0x2009534;
	int startchapter_2 : 0x12D3544;
	int startchapter_3 : 0x1633198;
	int unknown_key : 0x1CAF214;
	int toilet : 0x162301C;
	int end_chapter : 0x1D03C9C;
}

init{
	vars.nb_split = 0;
}

start
{
	if (((current.startchapter_1 == 0 && current.startchapter_2 == 0 && current.startchapter_3 == 0)) && current.button_pointer == 49) {
		vars.nb_split = 0;
		return true;
	}
}

split
{
	print("toilet : " + current.toilet);
	print("nb_split : " + vars.nb_split.ToString());
	// key
	if(current.unknown_key == 1 && vars.nb_split == 0){
		vars.nb_split++;
 		return true;
	}
	// Toilet
	if(current.toilet == 1 && vars.nb_split == 1){
		vars.nb_split++;
		return true;
	}
	// Rope
	if(current.end_chapter==1 && vars.nb_split == 2){
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
