// Made by Yuuya94
state("CorpseParty")
{
	int button_pointer : 0x32F054;
	int startchapter_1 : 0x2009534;
	int startchapter_2 : 0x12D3544;
	int startchapter_3 : 0x1633198;
	int test : 0x55E2E8;
	int valeur : 0x15D4A6C;
	long test2 : 0x1067504;
}

init{
	vars.nb_split = 0;
}

start
{
	if ((current.startchapter_1 == 0 && current.startchapter_2 == 0 && current.startchapter_3 == 0) && current.button_pointer == 50) {
		vars.nb_split = 0;
		return true;
	}
}

split
{	
	if(vars.nb_split<500){
		vars.nb_split++;
	}
	if(current.valeur==0 && (current.test2==-8 || current.test2==-4294967291) && current.test==63 && vars.nb_split==500){
		vars.nb_split++;
		return true;
	}
}
reset
{
	if (current.button_pointer == 101 && current.valeur==1){
		vars.nb_split=0;
		return true;
	}
}
