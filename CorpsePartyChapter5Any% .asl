// Made by Yuuya94
state("CorpseParty")
{
	int button_pointer : 0x32F054;
	int startchapter1 : 0x044F2A0, 0x4, 0x40, 0x54, 0x4A0;
	int startchapter2 : 0x044F2A0, 0x4, 0x4, 0x3F4, 0x44C, 0x434, 0x4A8;
	int end_chapter : 0x12A6B58;
}

init{
	vars.nb_split = 0;
}

start
{
	if ((current.startchapter1 == 20 || current.startchapter2 == 20) && current.button_pointer == 53) {
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