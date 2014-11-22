use utf8;

$handle=sub{
	$flag=0;
	$ref=shift;

	# get screen_name of the tweet
	$sn=&descape($ref->{'user'}->{'screen_name'});
	$sn=~s#/#-#g;

	# return if the tweet is by me
	return 0 if ("${sn}" eq 'n_IMRC');

	$dtext=&descape($ref->{'text'});

	if("${dtext}" eq 'Yo'){
		$str="Yo";
		&updatest($str);
		$flag=1;
	}

	if("${dtext}" eq 'おたくきもw'){
		$str="おたくきもw";
		&updatest($str);
		$flag=1;
	}

	if("${dtext}" eq 'まれいたそ〜'){
		$str="まれいたそ〜";
		&updatest($str);
		$flag=1;
	}

	if("${dtext}" eq 'ゆれ'){
		$str="ゆれ";
		&updatest($str);
		$flag=1;
	}

	if("${flag}" eq 1){
		&defaulthandle($ref);
	}

	return 1;
};
