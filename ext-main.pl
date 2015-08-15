use utf8;
use MIME::Base64;
use Encode;
use warnings;

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

	if("${dtext}" eq 'ゆれ'){
		$str="ゆれ";
		&updatest($str);
		$flag=1;
	}

	if ($dtext =~ /^[a-zA-Z0-9+=\/ ]+$/){
		my $dec = decode_base64($dtext);
		my $isb64 = defined(eval{decode("UTF-8", $dec, Encode::FB_CROAK)});
		$dec = decode_base64($dtext);
		$dec = decode("UTF-8", $dec);
		if (length($dec) != 0 && $isb64) {
			my $str = sprintf("b64: @%s: %s http://twitter.com/%s/status/%s\n", $sn, $dec, $sn, $ref->{'id_str'});
			print($str);
			#&updatest("D n_IMRC $str");
			system("totweet.sh -m 'D n_IMRC $str'");
		}
	}

	if("${flag}" eq 1){
		&defaulthandle($ref);
	}

	return 1;
};
