#!/usr/bin/perl -w

use strict;

my $n;
use Test::More tests => ($n = 27) * 12 + 2;

BEGIN { use_ok("MPEG::Audio::Frame") }

for (1 .. $n){
	isa_ok(my $frame = MPEG::Audio::Frame->read(*DATA), "MPEG::Audio::Frame", "frame $_");
	ok($frame->mpeg1, "MPEG1") or diag $frame->version;
	ok($frame->layer2, "layer II");
	ok($frame->has_crc, "has CRC");
	ok(!$frame->broken, "frame not broken");
	is($frame->bitrate, 384, "bitrate");
	is($frame->sample, 44100, "sample rate");
	ok(!$frame->private, "no private bit");
	ok($frame->stereo, "stereo");
	ok(!$frame->copyright, "no copyright");
	ok($frame->home, "home bit set");
	is($frame->emph, 0, "no emphasis");
}

is(MPEG::Audio::Frame->read(*DATA), undef, "nothing more on __DATA__");

__DATA__
���L4�bbrq�q�aqa�q�(�   32"""""#%e���v������sϱY��YO�i_�q�]O�Y?�a?�i��q��q�}��y�����'t����g��7����������߶�}�Ͼ�_�~��}�߿k�����{�׽�{�׽�{�׽�{������l|�������M��6���8�_?x��y� Dk�ּ��|׾{\׽�|׾{�����c|�s��xIs|��k�y�9���
Ry-Qf�4�^�l�l׏0�D��J<� �L��v�.�'�1	�q�̤6Ѡ��x[L�<� ���2l���T��"�2M%��7L*�R�
N��zI%|��\!	�����߶�~Ͼ�_����}�߿k�����{�׽�{�׽�{�׽�{������l|��yR!���m�0�����Ϸ^�nלe�_�k����{�׽�{�׽�{�׽�{�����l|�f(�2aQM����D7��;y���}�aTl�f��M���>�s`��{b�=-����Y���B[M�=,6�N�пn�tۥ��AfhY�����0�l-8bճ�@� ́�Cr`H�!=8!�����Q�啇�6[^-^��9�O�i�&��-i ݊-�(�QT��f�,�M�����m�1�O���޶孧��SZ76ҀA���k�rM��سD:�D�o��M� ���fH%;�Bئ�����X��>�_A�m��j7F������p�*��R� M�I�3���l�4ճ
B�v;�������n4������k�����\D���"b�aMv(Бm\��l�|�0.�@  """"""""""""""""I$�I$�            UUUUUUUUUUUW�}��}��}��}��}��}��}��}��}��}��}��}�Zֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZ֡��[&�MkZ�5�kTֵ��ZֵMkZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�kZֵ�h �����6((8�4�I       ]�v����7[_�]q��i���e���{�Yq��Qv��5����s�Xu��eȾ�����!��`~?�z���d�Ga�좒u�*T�	��՟���������>��~��߿�~�{����{���o{���ww�x�5��T�W���������������}������~����^���{^���z�������}�kUةR���������[���������~��_}�=���=�����#������\�<AR�co����������7�ߵ�ߋ������>��{���{�G��{�Ww˻��ֵ��1B�,����������/߿;�������}����/{���{�����gw��SYJ��
������������_��~�߿��������x���}����}]�.�ƚƺ
���G������?~����_�~W�����c����K������;��ϼ5�[�
)8����������~��_}�~�߿c�׽�{�׽�{ޗ��wx;�_SlZ�
z��I��������������>��~����|o{���o{����{���wv>Hٵ�����[�T��錄�A����}�����?~�Ͼ�^���y����x^������|��k����kd���}:\)x�Q#�F������z��a�	��k��9�S���[�-���Sl��(�=�=yD`X�[ͬv���Ok�#i/�`c���[ds��P��6l@5y�23 d�T� @�  � �@P          �UUUU��>����꾯�������>��>�뾫�>����￿���������}��{��������������w|ց���������������{�o{���{���������������}��}�{�����������ϝ��Z�}���������������߽�m��ww��;����������}��}���߿{��{���{�>ww�h}��������������{߿~���������|���>�������������}����~��{m�{���|���5�}���������������~�������w{���k@�￿���������}��{��������������w|ց������o��O��������{�o{���{������7l�v;�V�u"��3���
��鳛�����Z���NpP��]�c.�\@ܒ�>��ۦڬyZ���� ����uV22!!Qa!!�r�q�I   <     <  H�$}WZRac�UǕ}�Y��y�Q��r�Fba���}��Z'����}&�M��m� }H_J҆5�yajf��h�ZE�^yY�Fh��eb�������j���zXJ;���xf�Z����탠��S_5�{��{�׽���k^�5�Yٯ�ֵ�p|Xy2#��ld0Du�<vl��e���k�D�Q�jn�.fZ���5�N^E��HݶD[P[�`����:4m8M�]�"l�Z[��A��6}j�8k��O\ֵ�	��2��6�m�O���0�&�z�5���%c�׾|^�{^ص�{^����kZ� �]E�T�r�+V��F�k6�w�~F,)U���E�c��ܐ���At�T�����4-Y�$����(�E�t�6�Z�s��΂��"��sa�!���c������k6�(ݏe��M��Զ���{�A�b�BO���t6S[����5���X��V7|q5�	�D�>-|�g���>���!����Q�c]���U��d楰K�c��h�C�H��Y�84xTՃr������|\ّ6����]X9T�%ծZ֒���lC���<�V��Z/.Np?E�9�yX�݉\u���MS^0��tP��L��k�҂�����S6���H�C��%����m���h�5	CR�Hx�!)lY��i��/a8�.�.�a��}�l]5=�QX^(��c�ŏ����Ũ	M`��"��0�Y�@H�H@D@D@D	�A �H$       033 033��>��_��9o��W��Fd��b��7���������ibG~ڵ��ZQf��6\�)U{��E�>�4���eb_��Y>څ�����e^`C���E�m��_5�kZֵ�kZֵ�kZֵ�kZ�/￝�m��=�lڶ�kZ�šl�͹j� 5��f��m��5�kZֱ�l[��kZ���j��[;���9�m��_5�kZ浯iֵ�kZֵ�k�e+�s-�m��_)�k���h��kچݮn��d��=�̍k5�_5�j�֑�kZֹ�m�ֵ�kZ�=2՛�mT��_5�skb�kZֶ�k ٴ�kN�Y-����Ь�����"L��B�@���8��Ơ1�4�(A�m��_�i	V��jZv��iִ�k@��W(��m��_@���4�*��[	Ս���q���v�E�m���kZ�Yem��'kZ���2S!1~f�kEy����r<��ڢX*�ZFԂk�@����]d$42!"U&#5#i"�e&YD�    � 3� L-S�]D�eu]d\}�Ԋ�i�`y��q��}�݊8��8�(�~���`yǟ�����u�߆(��9c���I"�9%�Y$�Y�*$DGll��Wqז�LM�Uū�Y��l)ʲ��(Uh�8�V��f���ci-�4ml����k�EoON�������2��m4���ù��3F����M�3#;�TԨ3-R;��,�5���h8����򻆾�9hY3��NUf9���<�ڌn�Z�ծ�{h'Z�դ�"�M�c�����AS �jq�?t2�xFQ��|Ey���[���"��6����y&�I��)�Q�
�d�ۆ�R�pl���DH� 2��s�T�Dep�+a{�9L-�E��r��G�;6�cn2�j.\��a�0隥�9O3��[o��j��H�>�uK�[��q�*�kU=*m�20�K�LQ�\�[.���6�q���_e�0�q��ڋ:F͵��<�gx[6ΖǕa����ꕉ<�2\^��w��pY��n6��R�Jj��z0���❔�6N���T�J���"�Smt�7����l ޽R��1Y5�R:c�Of�.�8��M
z��@7=S9o2�d2��E5��UcFK���ps�{8��זg���b%
wQ�Ҹ1�UT��̒&�,�0.<@  6�b�@F""$$@$ D@D	CAH$	�      QUU]uU�5�VAyMB�
)�}>�;E.�����G���F��C��U4SG,R�e2�)������%�Tq;iez��/��x���� ��w2�h�9gU09U��H����'�W�뾁^�S>�#�[l2�1Bg�")�G���%����EW��+�R�ڡ���*�&1��m4a�3kI�!�K��[��\�p��YT}=�Sd�c\�0��v��T�G6tگ�&�ik�zF��k��4��孮FM�y�VE�EXFҭ�;Zѯ���mm��0��UA��b�Mz�эi��IG݅&ܶZֵ�[]T��%t��+fί�Ȗ��a]: Ğ#KCQȪ]��H}���a��?OQ�H��
��m[`�]��X�	!HZE5��ÃVܰ�uN��hP��q�uݘ]�@�� �����m��)�kn��H�����>�}3Zۢ���YM�Z���S��ja�6�v���)ՉV$�ڤaA����6h����iyn�t�7�k\��U�`����ޥ�B�`�B���T׬kB����ZS"#"!1"I"Qe$I$�    M� ��  0�A��Y$�q��I�a�^et�yםq�ay�"�H��)#�H߁�_v}��z�z���	$���9!~g�z&�Y��Y��H��+3�d��x��]�����b�Yf������s6)��ZH�`���E��$Fݱl�����[�p](�S"$;-f�#V�T	5Ҙ����\����U^����ZT�L���i���i�4a��z,����C��ݩ�ҷ���ٙK^�MY��6v�4kb���8l����^���۶��m���kur�U��閵�lϱOq����k��R�'�[A��se0 ^�4�|���y��sG��c��e9*\�#폨ב$�xz�:q�.�Q����v+w�ޱ���#wϛ�E�kfd<u��e�*�A�kZ�sS�%���J\ۂJU�1�f�aP��P�u_M�d�䤐b·
��[sC{�V�6$�pl}�4�c�{0��Rsg���.׶ �\kh�.�6Y�sO�M�TS����l-]M�]�9�׏�6[da��"�����    $���������������$��$�I$�H$       �QgYgQ�QE�\D�p��/�ˎ��쮷���}|�G�EP�t�8����q���C?��R}��?�Ҹ��s<��T=�KkD1}�S���M�WT��,�1�sWd�6�e�hi��|�6	|g�.Z־Z�4�j��iF�5�kN6�d��A41/[hh�M�F[f�Zоi�-H_)�;�:5�|F��k@֩�[ld�c_nB�m��yv�]���D���9�[����ֹ͂ڦ>��H5�l�9���(ٰ�$�J3�-�I��ٵ���I��Zֹ�n_0mZZ�6�m��9�S����n]��s_g�cZ��|�5�eu5�kDv�ώƞkZ�4�mT�z���%�dH@�M�#蹪k�.i�ѵ�ֵ��T��#_�h��1CI��E�;^�2!2m�4�)�ֵ�,6inF�Li(�9����Sl����F��{xӬ4�d �=����lĳ1��Ƒ��ؘ���c	g8���4�b��i�$E6���mM��}u��{eVkH�>kZ�5�m���i�ֵ�klօ�k^�2�YS+V�Ͳ[,���[�m864`�"'ko�D��6�%E�c[��ANw�m��eYLd�ɳ_�I�ʽ����;�;�ֵ�lֱC͈�;��q�W�R��!��a������mk M�"�ܕ�m���s`�5��쒐� �����T#""""#I$�,��$�     L�   �0(�(�Y��MT�at�m�m�[i��yǝi�����~X��)d���^�9`��#�����z��'��I����i&�J(�i钊c�|i`�e�#K�~5Ĝ��hVe�g�][ӡ�F�&i��2�F�f��i�$�C��i$"�2�R�:l�����5���UT��sR�P�ی׿��F�܀�r�I��6��SSF�ԷP߅I,�T%ׄ�<`l����ͬN�"��j��8��OOI�Z)�1�QS���Z��k���k����u��k_GN�%DwV�]]�����"WԹ>�}u�2	�J&ֵ����p���)uh�������6ģ���7D
�G,�'�T���]���',n�j�&H��Wz\K"G0�W�Z��@icZ��gf�@��7M^am3���M�&��= ��n�F���]���%�qo�`̔�d��	'�S���6�bN�4�������� ��[n ��5:�!�YʕAM0UyS���L�����#�Fۭ�ͨ�p��޿����J�PG;Z�v���0�` �$
�$d$"""""B"""""Q$��$�I$�I        UTIU\e\��D5Q�E.6���n>�n�-��@��V��ETUQ$�E5R����2��I�=-���u��C=�O\�KL��L��L�Ob�A3�SQR�rm�\F�0P�5ʂ���U�	�,�R��;Z���Y�]��;N�R����ͳ\�Sh読���"H�-����h�g9�cefqqi7rfҊƘIsl浍jT��nR�5�l.6Uf�h\ַ7[1ōk�{�;�=�!�AN��U,���eչ&CQ=`G���*T{��kH�5�V8�^x���X�7]f��ja��lx9�9�ucJ���Ը��f�ac\���oh���SJ��eSm5�k�6�e�֭�:
Y�AZ�g��Lk�9�V�	W��쳛!�M���������1Mm���.�R���J"���8�9�����Ʀ�]���[Wv��$,��c-����k_E�t�ƭ�Zr=�l��m�բܱt��n-TZ��sP�l�դz浳�q�kg%D�s���z�f�����<�M�&֟-m�gkmv���X��cYm��H5�m�5�SA`(t?l���DӶ֌ka��΃_Y���R��{���K�kH�6iT��Λ^��ez��iIQ�n�5��Z�!�LK��j�ʵ����M)���6�4��Y@ ���,�d3#"""!""14�D�Q$      ��D1 C�A�,�KI[QU�Yve�\n)"u�]q��ގ`�)��9f�g�~9`~8$��b�a�(b�(`�&�y������)�h�zg��и[F�Vm�����K_��7���棚�X���E���Q����),Y��t�	���M
|B�*�qˑ��"XP0_g� �w٢�!BV&02��D��[���ʬ��%��5����+��Ԝ�����I�ƨ8��J'���٤%cUd (G3��lޑ��E�
�W	�%u-d�Y8]�p|��6T;�T�M�,m8*�/J �ۗ�+mqGt�<Zy,+&�<VՊRd�%)R��.���O�R$gqT��m䛼8ޮ�9mV,�R���������现���SuBN�*�Y�z^�d;�5"VNYuf�r)Y�J�>{��	]S�c���`J|}$�s8�>ڕ�V!��Q`�#�����OG��W���;c�R��/[X�ݢ��Tp��W�X.�§-��Hi/|�4��Ĥ�NAF,oZP��[#�wT�#=�Sr �n8�r%9f�-<��k@H ��2�����		���D�ID�Q$�H         T5�5CUM�u�U��Q��ۍ��찻�?���C�It=<xQ%t�,RS4��%C}��\��sK=TO-W�EWUVK�zd^���]^i16�q)�E=�e�&��S��~T���6un-�p�g.����\�RZ�z��IM�Z�V��*t���a&>�YI��pf�S *�j���4=s�-�"��DND��c\M|�o����$Z��N�ј2�E�4�{f��qPG��J����L�k���iGZ���6hص�s	��c�[e�T����
�d��T�G�Eڪ��(����9�T�cF6�k��4�BM��#��dH]��AF:"����ۑ�F��mq�k��%���ڔ��r���P�Z׬��b-Um�C	�Hz�ט�i)I�ʣ���MsXֽ^��Nq���u���h�E4�qk�0JmE^�T�����T��r)��
���[5�lZ���,iY)�F��YSI��CL�i��U��-Y_5�)�{�Mr�A�k_�:Sp�j��1�����T{�T�D��[=fӦ)��c��x�ϦԩMq���U{��{Z��R6�}����Nù�1���sZ�����/_5�XV��T���s��h��6��t1�^Uk1f[���e��`���T��IJ�+����5��4��Z ���4�T3"""!"3K,�I�$      @@ ,�JE%U�X]�Zqf�eؙ��^m��n}��9d�Z&�Y��h�i#�8�HbzHݒ�)!�x��(撉�����:k�9)��i����k��W�\A�:��a�r9��04\gbMi�\1V�EJ���eu�G߬܏c[
[%�	1����3�� W,$��[5�馠1`���]i��@���pH�����G��p�uR��`>|Ƶ��4ud[�x�2�z��p�l�A9T�\�֥A�i_sb�u��R�Z|M���}a��Y��6�o��M6��m%'�����g�2`qZZ�4�R���cY�� ��l √9qâ�_>to�@�ʽ<�1�bK���񍡷�H�p��3�h���{��l7�U���5Uim[)��*ŋ�Ѥ� O��.<���Z�f�*�Kfͤj![�p|hB媷�K��<��6z�.�(��ƮH�n�MW�v���3Z�.&�hI����c-􆺉2RM BD{�ɷp���4����4l����>��Ϝ��(1�I�G��Ӂ����E�Ij�f�&���Z���rM`�5OT4B՚$��|��[�����*H�����������Q$�I$�I$�        M�UW5EUUTYT�UW�$�6Ӯ���rI�KϿ4/Cd�aT����D�O2Y}SIL��U�M�^�]�$A>�F��'#Ej�Q�D�&	�U��5�J$���r���#ZF��Sa1��Z��}c5X�$��"���c�m*vs���#[U9{��Vl6'
�)�.
�=f��D#,�
GִdB>9!>j�i#��|N�5�Ɔ-x�Md�-a�Z�R%���TEE���j��T�N	2�-�\��m֊
� �fq�;�X��J#nJڙ��1&��Z��c����Mq��kT�5,\te���+M"4E�J�i`z�Z�̩�Ӵ;5f�BזS!�h`�1����f�T�2P�*đd�ŭm{*���n\��C�j%����m�&1�B�4�8FЖE�1di��(,#_5϶4͎剪����alj�ֹ�kTv���:��f�T̄G$h��5����ͬ��d:��t��pc�&m#m�ō�{�]�<�	��TU������ֲ�ĥ�6�j����H٦d���d]��0�����fU�$�	q���\F�s�>����3���Z����a�S`�Q#w�@<�-P�*]�ҎD�4ƶ����N��km���hm��֠�S֨��� �����T#$#h�M4��$     	� @b0J-�aF�a�[}�b�؟�fb���8e������8��ya�Y#�8b�(b��(�H喉'��皻-�z)��g�T�A\�mu�
�Bl���>���r���f��ckZ�y~zpJK��Syږ�-[S�J�2D(aS3���anYO*b�qC�PQ�6�/k����[=[����V,c1��v#���+Y�x��-���V�΃�K[D���SMf��.f�vkm��B�e	�Zyf���)�k\Zj��s!��XŪ����Km�Ԧ5���yr�镭O����auM���Lr���892����8DL�\�����*�f���f0B�����΍��Fy
�bA�cJ��&y����9������늖�#�/��KjO�̧��URU����aB��kv�ź�g;BD���wm�"�nP~%-x�������񑦒X�P�=�ٸ�hA�@��r@ܗҫ�X)�T#�ݍ�ebIfci�g�����[;�X!H}�+�Ռ#؜���GB$���ك^Y�O#
R�
�I'm�"��	�����������I$�I%I$�        Uu�]���fY��]%$n<�D�.3�A��D��S�Et�Ô�_���n4U�U���崔�f�O\Rό��nu]%gM�Q�6W�w�.��*��"�x�4�� p��T��A�~XT�;Mў���"�a�&��I�d�Qa����vr6J��4�䳚�mh���#Z��!)��]��u��'2k-$KK1B�i��>T��G+PNm&���Y���e�d!h,�c^]r�Vs B��5�lf�}c�, uҮe�1m$��m�G�SlF��E�;\�8��Ŕf�*H�%M\��kE�{Pִ�chW�׽����õh��~��uQ̆�S�UY�6W��_6�5�v��k��ϳ��H	�Cl��(��T�$TSE�Q��-���JE��k���3��f%R�B\��k&N��)�b��=TB��S�ar�5Dm7Me+R�,f�1!A�zB5�z�X�a�W3V��wL� �2RH�d��c�F6~ñ�����z�k��f^���myh��R��$�!A� ��0t�����pl,֑xs4�ݜGC��f�����S:<4�]!skZ�1�k�+^�f��f(����}�w|{5�%��>6Բ�u��w�)Ȓֶ%co�?wf��]�NZ��*l;�]���kGH<� ����c22!"!A#22�$�$��$     �@D� 0 �,�Zu�iwQ�ށf�(!�F��F܆8��Y)��&�h�Y�~c�(#�x��("�H_�Z%�i(�h斩��K)��'���y��S(L�v��Ssn�ֿ�|�k*��x�÷�:������V���[&d%� R4pTm�և��	�M)k6�yv��-}@���)�J"8�l 5d1>^�1�̀⭒nCX�;^�d��ճr���y9F�RV<v�,l�ءO<Hn�ih�F|�A	{5�]��m��F4[���?�Qs# t�~v�@�~l0m�a����"pc�T䎍'�H���6��zxoX����ø���9�,HD.msWm�|�ר�
x��$���)q�wZ~��p����j�2�����-�-�a��VU&�. Q�fu!W��br�#[�4ĮU(����I�i��;v�4��=X��U�9�Z��ѣ� 7k/QA+�:%��(���o�i�eMi���|ڕ�V��R�]0�uehF	���G(�T0='u:�J�)S�^�[���Q[�J�2E,!�&��\l�N?�hX|��_6����ִ��XI$�J���	���������$�I$�I$�        _T�WtUUU�UW\�14s��/;�����E�Kt��,0ߌP�T��>sQ���&��,�QF�ѥTם�_��ݶ{c��/W�egcWSR�q)`!���*�sBa�	��v�Y���[2����NrOe_��fJ�p�f* &�����Ak!G~�Yvc^��z��5�cc)��T�֑�T�.<7:d�âOGek��2�ۙ�|`����䅀!�Pb�ɵ"[4�T���:bU3T�M�M�=Xk2ak^іn���^��F���ֱLcMT�"<a�%P���V�wkf�l0p����lT��;�Q�k��>I�:�]h4�Q�(�&��J"��#��H����D�;mU5jT�=)�.S����fug��j�662fJD�,9śY��N�����'F��"Y�~JU�ue���1��kV֕����C�X��5�95�f�5֬��ֵ!��Csmg���P�j�`��1P�f� ��Wh�)ʲ��e�5�if����k���+Zٳ# ��`��(�,�\՘V� �sZX�6�}F��kW��{?q)ͽ�(ݮ��Թ��R4[J2�^�m�,�MK2�Apz������_W

	#Z�@�{Z�݌Slyu��Y�E3uU���Q=�[��؄k_B/�s��iZ;�+�� �����B"QqQ!7q�Q$      � �� @ �D��i��u��iv�uǝn����~'�u��z8#~	#�H�(#�
&�yd�X��c~H$�9!�'��zGގ���~'��)c�yb�X��t�`"���O�uf������E�D�6Y!�/f�|Z�Y�T�ɮ8���g_��v�a{0Z٧T��6H�DZ�PC������#���{�I,�p�}\Ȅv���jU���Dg�3���!-wVs��v73,u��N�������Jd�TL�i����76��G���BP���Ƞ�Q���hv�j�ٯ���+��NQ�a�sr���^�5�aR�V�̅�-<Ԇ�a�R^l��ȮVUSs�ҽ�x�3���n���5[ni]�Z܉����Z�DƤ�@��f3�i�{Eؽ�ŅR���qIH�f�nI��囲ˠvnQN�ڌ�׼�)^��dy�r���8ՖJ� �:�Wڿ�D����2��A��31�z����s][��VNJղ@WSϾ��U[,؇^MiL�V{ݍ�)3'8�{�G��Y�5BZ�BZN7GhnY�խ(=;��	\�����`�{S��M|\�5�sS��8XJ��}��`��b֔��x=���r����c����_c��"���������������$�I$�I$�H         t����M7]}u�EuRm?O���L˰�3GT��,�M-K<w�DvWE��M�OM6�-XWt�ׅUQ�tWVVYl�]}�c�c���%�.���4�m�6�q���k��mu � �ZsF3��6�5�f��Ҋ��-h)�U�F*9;X�A�)Y���5�s ��Uks�!Q��i��$tI4�ثZ���F�a�Ե����Ve6Eai�9C<s�q4�E���ֵMeE�-�p��ٳk@ٶ�-���kƿ-1D|���ћ��-"��$sTƵ�k[f��KI`�9���e�L�e��z�i��E-#��>-cZFͭs[F4�) �Y�*��aѱ��-�l�3,kF-�[H���2�Z#JE1�#I4�S`F�nR�G2��М���Zv��cR��sZA�(�.|�jă[d��P�+񲖳[y�4�r�<����Ͱh�kZ�M�i�֩��fF4��0��RO��"ܽ����ģZ���˳6���Tv�͋\�ِ�6i��h��$ӄ�5�j�d4�S[6�Pi��(]�̀Z�%�Z�E�a����l�L��q��T�ԭ�;IUi�lV���1�����B�B!!QqaQ!aQ;q��K$     ��2 T^�Y��iƚe��q�i��}�yםy��z��衊����v }�e��m�y�^u�v݅�`z����.�WGE
T��{E�jZ�N�6��k���{��<�{�e���͍�����"�A-�ο���$�3�v�����k���9|���v;�c{� �
c!�	d�����浰�I��k��	�y��7y^��k���Z��l�	#b���H�0)�&k������nsqg��{�׽�k���>^�3_��� JỸ���/���֟�r�ʮ#�=1�~�9�+�6��>$�c6�#*&��%]�>�^c�-"V����x�7��|��S���c�k[B����4��� ����$�6�.a�8�$!Hoy+�ÿ%Fa�)7�mQ$�!'3/���<́"�.��Jh[|G����-�k��fd��sL4V�'l���,Z9|/"(��-��Onj�����?5�uF��k����6��:6��@�T ��q��4���k�s����.JbA�˛��e+^p��j�E�O��!��`�g,��S���{����v_	�S����4��̒5`�E������p����˙�\{�b�)�81rF���kL�
 Ye�葘��������������$�I$�I$�H         �E|1Myu�UUS�K$MG���O���El��=0�EM�͕��-�QN5KEUUuuOtu]T�S6�EO]y�ew�E�[~6e�Y��FET>����;��̙k(7��p��]V��Nt�)���9&������-�ZUԎk�(m��[VSr�ͭ�'6k����tL�nݪI6�mJ�čJ������B�`����F�Fm����0UT杮STMڌʥ�;���D�[w��O
�h�1&�l�kZ�5�i
ֶ�sI����r&�9hZ�4�p��m#Q��HME���k��5�i�7-ibv�-!���Sb���}�����چ6%l��5��\֪k[�Fn��5��l慑�")����4i�!�6�yk5�l�v��cH�ΪiK�jIx5DsZ�y���n"Đvc�&��v;.s�Ŭcf0kL��lTǺ�5U6Ԑm��jF�γ[�7,k���k`��1k��v���50Z�b�-���@�5�[k5�m��5��<��I�)DmY�i����C[��2kl�6ڲh�,�a|٭SZ�ٓm��5�r]f�@ ���BC!UQd�M(�@   	   P    a�eEV]�A�Xi��q�\a�Z��فv_e�yןj܅�yǜqG[M�Vm�[e�Ym�Vy��m��m�^uǜ]�Wy�y�`m�����^vA-g�+�b t��S���*�x#n�e����.��U����-�sd��AA���5��WS�ؗ��|��u���nnq��7X�.T�L��ѫcZ��|��+B�CEC�m��z��GrKu)�a����,�-�n'
׍C"-�C�X[�u�����8�䮰���ݴ8Թ���>���[�r0�bV2L�/�c�&����k,5���A��Mk����w������^���&���l}:�'D;]��R��h�C+\�h_;��[֥&�w|��wv�k[f��9��|��j��kZ������5�_5���;�wu;��Z�C2(��i��k���`�ڕ���l�*2�(w ����q� ��iM�oh�v��fy�����8j�A<��f�M��5���i9�I�J��t�cH.�ў��ڌ˭�Ns�lgȆ�#)��Gr1B��V��eP%�F���\�^�S����Di$1$G;<b�1�3 �}�N��H�&"""""""""""""$�I$�I$�I �@       BT���,��H�L�4�T:�2;.�ڌ���7ME[�34S3O��SETB��;[T�UDT�3�S����<*EY]'�EKQ�]M�\��3��,k�ձKm���0��wp�k`֍���K4-�ZƵ�kݦ��R�w��I{5�kCp�Gl��Kj�ѭc[���m�	��kJֵ����4�kZ�6�n֤���U����Zֵ�kZ�4�kZֹ�k[`6�kX�5�kl�5�f��9lk()9-�s�ֳ^F��%-h:pi���4B2��@6��%�� ���d�fn�	I�a���h���Y� н�&Th�U�56hA6j-2qe��k6�k�Ӷ�Q�ҩ�kZ��-��������k\�����m[���h�ѵ�kB�M�k�ք�\�յkH�NZ�mkZ�SR�1񅻾l�5�kl֤�!��Z�4��T�ݭ��F�-�[V��C�(:Mw}5�iӽ�kZֹ�lf�Mr��5�����k[�5�lC�(�$�����6d���S[f�-Ԛ�5�sm��k[���i��F�vQ���5�if��6[f��Z[V�-^tƶm��6u�Ե�:�f)�3��E3mf�����kY�9�}A<(��k�]�k\ ����d"!(��-YD�@    Y�B Q��p)fNYT�YU�e��e�e��m�q�_v�~ޅ��y�}םy�q�]q��i�q�q�\y�^�ם}�]z^��"z��'b�'�"���%C9�Hө0y�(�E�1��k����mPT �P���ȴ�&�6�r������ta���$��pPj�k�V��	�9є�)X{����V�N���a�=�6`$�4kZ������Ǧǳ&蹓]^�����aLu���`�z��lJ�ՌAj�r�J��:�Kk��"���bAgtA�u�y�du�Ҋ�s�:l�&1�͈�om�Y3b��}R8�ֺZ�0� �A�M�`'�v�qg���$į{�ǃ�Κ���C5�uU�۷͸�.��c�3J�E#`-�e�������GY�Z�a�U[���b��j���J��\���{Q�.7�1Jf�0����	��퓂kT���>S�ƚk������)�uf[�;$ڤ�t�nNU*�X��yem&��3��5��o��sY��U�m���k^�5p"�{��3/zԪ5�1��d�_1)��|��lv�)�3 � $�䔈��$B"""""""""""%I%I$�I �@       UUY0�T�WYUQm�]Q�����.��B���$���p��P��M��50G$��?���G$2?$r��M$��%sG4�K,sS$�{L���E���v�g�؋�kZf�M�R
� |֝��+�MZ��J�6n���6(�#h�|,�6kh�5mD��T�5�k�@�k���-�֪lK�x���Z�%��c�����,�`��愮^=<�H��5��o��0M�$4��S�S[Z�nk�&ok�@�nb�V�6(4����f6�k[�5����ܣD���\X�.�M��\�͖���-sT���-a�٤u�M� �jԍ��3�ǳ*���N��[X��k��Έȍ�=�kn����Kb�ٱ��W26-�H�oe��$�#Y�Q�Gk\v�d�lִ�\�Zo�U��,5)$�ա�&��'�J�A�i��)#!��^���ST�9�>�}oX�ZӘvƁ�jכѧ����i-��JD٭���S�ۜ�r���,=o	�^�қI�k,ƪk^�AP:�繮SU��f�ف �-kZpr����#(�[6�ٰ%�Ѧ3W6�u[��cbTq|��L�7=�i�zU������k:#5���ŵ�c�d��z�[�&�5�[JM�<��q����7)e231E�EQh�    � �@< 0��-t�9�]e�a�Uv�u�u�q������z��8"���7\z�z'_���q�v'��]z^���(�8��%r܊8��)d�,�����c��NX��b�#�V�.�~M$Yj��Q��γ�2
�DmFk��0�$IN�ji��L[�Lx�0u�Ž�JF��؋�uwv��
qN�QS���4�ɂ���	0a��KZ�D[���a#2�u��ו�k�֤I6YN9 {�;a�Ԩ�A��x�
��
�u-�ia�p]J�Ȗ��CW���!!�$xcb!�T?�-��fw�V�\���6��X����p�k� $�W%�Ǎ�Ш�˓jk���D�pl�c<징�MZx��Q!+٤��A�pV��1�X��5�p���#�F8�mj��|У�ke�b֤y\b�їv�J���L��i�ʙ�X�J�IզJ�a΍��v�0´wz��o���$ly��Ug��ُj�Z��*,���6���<�J6g�������3n�m�22F$�t�����֔��ݭؐ[�Z�*8��{�
q�u(#���Zۙ��y EGkw�W!3 3< �D�j�f$B"""""""""""%"I$�I$�I �        uU��W|�uCwMU��V��Ƴ�2�L����1=$r��OA,�Mr�4rE-OG�R��G$��,�MM6�-��M��5*ɴ��^�Xj��w�T���cRӌ�#H5������bF��[�F���D`�F���a�����[�{e��2����sU��4k[YU��q�,�*܋{vkm:�Y�h�ڙա��-cm�ʕa6�`�v��v��K*@�SNi"�2����5�Z��w+HF�s�qYj[�\�NN���N���,�i�s#45F�l�Y�S0���6�������6�]�7Q\$�.�mJػkM�
Lc�]�H��s`5�cH֒m�81*��#�w5��й�K��D�@�fHh��2S*�l�ҵ��2�U�i,G)mt�D$���H�ůd��lJ(ۉa�2�Z�� ���f��i"t^�5���ƕMl	�5��LJ��QG���Vbyj�֞�%zN�$�p��Xdqm��46"Z�U� �C��>�)6��v��]LkZy��kʥ�m��9�[43�Zֵ� 熐j#I5A#Ӳ���m���Y�1U�kZ�媲��Z�1�lT�٭$+��c�;,/M+n�&)4SHF���t��n.L��k�\kJ�٬r�H5�kBb5` ���A�UR#!!"#H�D�L�    / 3    �=K1t�A��N�aweיuכq�a]��u���g�'��إz'ᅦ�i�Ze晍��m�؂F���~	^rG܁��e��~'����%�7������(ژ��!�+=Ț�25�����f��fdk^�@��S���m?Hrf'g6�I'���%j������N�T��gB��-��Ak}��xƤw��@�j�Ɣ�|�k�^Ua%�Df^�}�)lp��ka�9�i+b89��Z.s�\�
_7n�ʀ�@*���ԅ�[A�+&��[�rwjm��|'�c>kZ�Ѧ����0j��w|־w����Ͷ���jbf�m�5�l�Ϛֵ�M�|��tZ����5���l|��m��%�7&a8�wg�|�)��5�J�k_>k�".�wd�S�w[>|�kJ�%)��AZ����-��}3,t�@T�@.\Š����-�#��f�@� ^E*��KNi�(D�)���+x�/�Rx��(ƃI�9������::���Ö�;(f�3�z|�����5*�)�ٙb���m���&)�T���h|Y�V���]�@�Q�9k^������k�w[�|�kG�k��,����_�}�kF��W���A�d]�Z����ϟ6��0� d��Ĉ"b"""""""" """"J%I$�I(� �      ��FQq��@eu�G�̯��.����0�Ò�+.JӲ̻����ʴF�v�|�GsMU<�Cq���
��n�ÖQewHӴ[<Y[�an3��6��4�Si��M�J���I��a�4̫Z�$֒�$ ֲc@��$a�9���>�sRv�2jk��*0� �Q�iU��2�m<
ƅ��T�hSkG9jr�S��)`��dX׵ζ��7O�a��V�ݹl�*��(12ҳ�����^�<�ɋ1�=�Y��`ۋ�����\ة�DG��R�����ff��kl֩�m����+�]5�|�>S�6�n^���bֶ��.��kZV��k[s�-�Z��dkb��|u54m�֍�S��iu�K�SN"��m�Zֵ�i��4"iց���kZ���Sg�kZ��G��lg4��r��S+^����kKh �;�X��!�j>�f
n!]��Ȼ�l5b��sZI�̥����lZ���"5bx`���qŵjs��[���s�	�v�>mf���ݖ�����T+f9�s�>u�ַ�)����n��5�kZ��֣H��m�5��֡�kZ�5�}f���1�k;;�r�a�kH����[��-s��_4�sZ۵�kF��kZ ����*f3"K&�,��$      @ 7  @�,�U4RA��m��q���[zu��e�^u��y蠒ya���7��~(]��b�H��$�(#�9��id�i&�Y����i��l�Y���Riڑ<�Z�Ԯ
�T���№8%Kv�����Z*gFƬ4�ܭ"�Y�oƕ�f�1������a�k��yP�8�;�U�u��B=X��öj'¢�����PiA�A�^4�D�kT��k�/�b+B�S0V&��r	[��n�NK�Q�m9E�l�['Ѵ+7/����@/@T������>��m��:�1�UU�� Ϲ����5	����2mm�C$}0�V��"eg��Ws����El�z��YV�k�7����� ��R�M�(�ۖ�j�����&�U2G�H�Z�Re����9Ʌ��GR�,)��IU�*v�	��=l��[��_mJ���z9�	lZ��%����*Q�?�(��!��8zfJh�E�*Ѯ���"S�ig��5z��I)`�q���eh�>Ρ�qqv�$q���z�P{S����V[!O�\�	��A���������������(�I%I$�@       W}T�^]uw���u��H�2�Ѯ�P��p��E�5tK�Q4vSR�D�U4p����C<RQ�I4VI=sۄ��>5���e�D��P�A�1z���	�"�w�|]�k\��h�B���")FI��j���V��"e:HMNM蛚G>���6kی�j�C#q&H�6�Z-k�1.�%�-5I*A�Ũ�1���fBkd���#_'$j;j�p� �#V�>k_���j<��-�DA��յ�#T��ˬ��Y�iQ{�y��]~��|9��u5Z�ץͥ���f�,�*kr���e�M�6�q��B2�Z���cr��A_Ќ��+\�*ZF���hT�k��4�k]LU5��B5Q;�]v!�x6��3���V�\� ���0�]����d
���d]5�L���K��s��(��{m(ʔ�e�mr�{5�$�2�ˡb���:��ָJڧ5�|՜Lm��m�GQ��\"��Ml�c�����F��~��
k`��?,���@�l�E�sZ�ϧ�b�ĆLYԄh��i��+�G�-�����bQ��&kl�)�[5�i�}����h#0����5�}Z��`�h�+b�֩�����cP�g	��kFR�u�ߘ��L�@"4���=>��6,mi�u|ᵰ�k�xg��0�������D!"""""H��ʜa�     P  @ ,�U�MfY�[q��i�߁�`f�u��]�`V(]�V�}�dr7܊�}��&�jHւE����b9��e�n�����bj�w'��&b���9�566(ۈ\���N���]d�!�T;	���sFo,�F��Y�E��m�H���jv7M�^�����!�	�t	2�`���82m�(����CVۤ&��y�:@�,�e}$�{hU&�*�s��ne!�J4m�7�P�i�,݅Ä�K�&�2/E6�0�q�l�@�˸�K�E�Z���>��o��H{N63⣽pG����֥�BF�MVi�1��w(А��$�֕����j�-s�,�2��d�Mgi����A�1K��E����s�AN��n0嬏c܀�j����f";�+j2D%0�(�;��"QYWT%$vj�������Ep�*�<��qA��kX���ϟ>SZ��>k]���{�wk����[��M�����m�L|�+�ϟ�l7ϟ����������{Vƭ�|ݤ��kn6�־}��Ϫֶ��Ϛ�w|��{������cVƾj��o-��R$͆u������`Χ���px9���
��EJ ���� ��$rG#���������������I$�I$�I$� �     ,K5+M��6s�4ɂ|p�/:����$�07�D�q=4L����,��Uq�<��#��U�ԑM��4R-�6KU��WP��N�5�5K�D�75k�� 6�2�	 խ��#�۶ڞ�f��{Z8��\,����1�sg�b�����A�k�F��ka�30��ص#lB�]�Z��$��trk%�fҬ֑���re�lC���\������(1�5���ֵ�4���tQ�9���Z���G6m��$Ms�D�c�TQ��Xܖq:���V�U% �Ub4ʰ��ԻN�*�,ѪQk�֩���t8�(ZG�t��H�,�BG55�Z4�c`�++Jֵ�LW����0%B�{��X��k�Di��JQ���Nm ��j�Òր�40r�U5KP^SRS����7+[��5M�湶kZ�A�+�F�m[Z���Sf�aHl�1���,�m�sU��nZF�h`ЭͳZօ�kZ���iX�Y�k[}Z�&66�al �U�+Z�ȍ�Z�5"�gvѱkd���l[5�hZ�؎��U���Z��Mh4��cWv���f�=�i&��kZv��lֵ��4&�|s��6"Ɍ�-;g�d�,����ґ��m�4-0`�� ���#U"R1"!4��(��D�      @0�  0��5E�EU�qs�]g�Y�]��e����a��U��y�u�WM�\eu�}�V]w�Q5eT�qeSZ�Y�\mu�}�Y�`u�݉�^e� v]�$�H�$���]i�Sغ��5ccM�e�0ad�Hpkf��Me��}A?i�$�:�m�ۅϦ������������7=j%��Ic��!�GG�y��k��>}�z���{3�[m~F�1���m�k[̇�9���m��c>~ھ��;9�͸�km���k��5�=����fX�J�F���+�_E��1��_Gg�m��[i���i�*U)�GUSY�^���j�GE�p��k�����M-�V�c��֣Q�3(�9�]:���T��2��w�i��m|:�]������9��*E\�H�G
�D�ہ���l�;s6��`�
��n���U`j&�JТ�y�Y�܍����%�([i|��5ƶ�Ei�ƺQ7Ѣr�gi�ΫX�Z�o���x����-і�t�!��鷙O��b��RP���.�͖�w�)6��^�	��Rs������e@�!���7��Ot;�r
gY�Ia��p�6ސ�3 �[��H��D"""""""""""""$�I$�I$�I �@       �waDv_e�_~g��,�ѻP*�
��'���Ĵ0G�B��C�C*���+�[���m�,n��Q��
��O3R��ԭC�ʜ�L�t-<��շ<��}M�\�5Q>��F�t�/DD�O]��XF<�SҶ�74,�A��	��8%Md��k�ƼR�Q�ɵ��W4sB��{Z�5.l�%��X��di&ְ'�`֪ʙ�fvk��$������Z�Y�t��ksZŵmt�׵�kWf��#Nֲ�׽����7NkXƹ�#H�����ʵ�h�٩��O��d�ٴ���t�Y%=8����#[j4gkZ�5�#\ֵ�x�ֵ�kZֵ�h�l%�.����[5*Sd�A�SH����i��m�I��cm�͛R��蘘�vMMJV�͆n�-�kf��i�4V�55qi��ݏ+YWYЋ��ѥ�z�����1�5i4-h�vL�i	vY���I��c�Yk�%�^I#n�X�R�ֽ����!�y�`�MM�Cůkr֩V�e5ze�j˙$Ʋ-����m%l���fZĵ����ZΕ�C�U�T�D�jqy�v�� �H�FM�7)���A��B�0�s��9�n��B�rR7kU�H-� ���;Z�jI�W��,�خ���cU��������^XS$"(�I$�I$�     Q�8�@�@��]ga�e��q�[���e�Z]��a�ivZQ5�eeSi��ed�]5RME�U6Zed�i��E&�U'QUyv]���z&X~e��k��L���mF��j���H���c9�K�+��S�Ʊ�r�r���ة�JA�}P�fB�9N$ �:n�K1T� �=�m��KArxB�k)0��[Z�U`a���ݭE���8�{�I��u,��$�,a]��B'���y�	R���L֬p#����J���L22j4���=�b0���G <��шl�m9�T��~�v.[���B6gJ�VŕeY��_�Ί͖��K��\�B��a�B><�2c�-�L;�ud-h����c��F�`�uUgj�n�$yj���# �o�y��d(��`Ɯh�J�FG4�J�zbY��IU=�h��*∔��(�j}X*n	%��I7�-�l�VkHf�ڵ�Q$J�b�խ�y��?M��kf�a4����ִ�L`�nb�@s#\�%1 t5osyZ����M!�t6�i�֥�6�k9mh�(L�5I�   �������������H��$�I$�I$       qUuQ]4P�]Q]�S��o��/@��-�CRC<����U�UO$0WD���F�D�1�S�vG$�S�W4�Y,��aK�l���K`�n�7k�}�֕5hˇ�\�앮U�4�a����8Z��m��쑂[��ED�6-B9ϋ�g�m���h��Mf�)W�nk��U���V�ܬ�TE-nD�vHm8S�������l}aюsZ�I����$"�8����ԧ%S!�H�@�a�`�eA'ϓ)��X�n]��Z�cH��,�HH��iVɰ��$�%Ŋ�V��s�պ��Q!u�J�lN(5�M�ֲ�Sb\�T��!LZ��#r5[�,�5��Ug�s^3P:��+ReU��Ѵ,kZ�]��r��giMjK�1شD���9�P5�|7��m�P=���\�>����#lr�2�$[$��ГȨ����µ�����f���kR]xl�A���%�sDִ���m,�xx+#������`�T��J���S�5�o�JY,�r���k�E5�lDJ���j$�:�vL�v��GV#U�s��5�{6�g�m,ҵŲ����6��U�]�s��k�-�:�ڍ�a.��������EvEY����Os�K�W�R�� IVj�X�M��9GrB7��5�\1?��I����i2�]��`  �����F3""!$�I$��$�H    @ @0�6Mu�i�[]�X]�m�Zqחa��euZev]��u�RE��M&�eD�euEU�M�a��U��@��E'\uT�u��Ig�Uv_���j�aw�m����[��_�c쉛i�a�iu����a^�(s��q�����1�2Ф#s5���J�a,�T����g"W�-�2�)����%P�{K[Yb�#,�iJ�4�2g�\X1sj��,g:���5����i��^�=r���yd�'q&�4��݄@���IM\٤{�4�)C���l
�.\#GA���w	#��Vjղ�<x�4�u(U�j�ґke���ɱ��O-�]��cX��)��#�f�G���խ �F�bK�N�&1\�*º����c\��b:m�f����3��1z�1s`HM� ##�!�d�R֭�k(L9F1�yƪ�}>�,���q��yH �s\��l�KZ-�dAkqN���QQYT(�%�s�-
-��a���N�{���"�r$�ʢ�p�V������*lY����A):�V�mQ�0+�pT   �F�D"""""B"B""""JD�I$�I$�I       ��UU]_Eu��E�w�U��2G$�ˋ0��B�1=O8��<�1�sK���QD���D��E�K0�oM,��<�AD��4SB�EM�]�֑h��-�!4$k�5�Ø`�Kٜ���1jPZY�`�A-3Z�s�E�8��;MܔQ��H_7'|�ᚴ\�;�����e��s[�M�Z�</�X�Z�s�,Z�F��:���k�5��W�����-m`ڵ�rI��f�(f1���O3I��C5�^l�'q�ͫkV�̺JME�f��k��5��mA�S�Z�W�+! Fۉ��)�l�>si��h�Dٰc�mK��a�p�0Y�sX�6�7��{�-�u�ID�lhHFEt(ލ��W6g#.�kZ�aai �ϠশҲ�J���f#,V(�6H�b��0��v�c�'4�cZ�hI2�ڢ*��7-nQ���`y9��Q�3I8)�|����6�ktN��f���&���r�E6�cRl�(���^5���eD$F�Y�XY��DU�B?x֓NkTH@���4�eF���^%#�5��SV�Z&�p�<���4Snև���ʳ��5�>a89mqv0��v��*��r8�_�Rb�ukV���ENi�DkfV��S֊k`0>�U
�LGw�.��4@Ƶ�l�)��P�85Z#j���6���dkZ��@ ���q�E41(�J$�(�@     @     WUc�IU�UTYU�UƕevY��u�\UGU��y�^E7^AG_i�y�QM��u\m�Q�ieqWTi�ygyיaטy��uǝbW�v`}��^��r�o���j�$��5�,׬l��CC`�n�z'��jU�e��kX�&�;�ψV���Xb��kq2}z��p��)aҶڅ�mTWY���A�[gsh��Tֵ������耸_59NK�"�5��*5Ȼf`PV��GhU�繋�H�*�Z��@�a[h�}��Y�ͭ�=B�*YSpV�����j�ƪ%��c�\u�����f���Cߵ�$_��p�?c_9�0?D�&���kB[�vn�ֺ��#��|ƽ�|ӸC`��|R�����#kֵ���³��'wk[w�k��Z�5�Zۍ���Za��S���ֵ��t:";�C��i��|��E��k��[�I�S�n�NU�kZ��ǂ摈&��9�v��փH�LBk��dL9TZ2ȕ�km6HA����d�S3��V��g.t�Az���s�5rzX[f��;��ά<eH�h	-kC55�Ѡ�Z��S���Z���ӵ�ִ�a��$�"	���������������I$�I$�I$� �     R(A
0����\x�:�βKF˔.��<�oE3���*��MF��������O;�����,Os;�3#G������B�ʼ�)�򑴬QMKr<�J�E�S�Tp>�@�J5��{H��84�kZp�j��媋Z���,��5�kT�)�c\ֵ�E��k���;hR�-m�F��j��Ŷ{Z�9�ֵ�kZ���kV&��彭k��kEf�l[B6
kZ�魻Z�5�k�ֵ�k\ѥ�sVv��X06�7�h/
��#HJ٢9m �i2ԑ�m�G+)$�e+9R��q1db��.*B�!�����Z�%cJRɖ4�M�Z��Jj\�^�,�vd�1"[:�l���k\�ݭ�ZԵ�rX�5�b��	�kZf��������jZ�5MkZֵ�l�ֵ�q�@��kֵ�kZ�ݭ�[f5�Q�Z�kj�5mkZ�5�kZֵ��Zֵ�kZֵ�kL��;Zֵ��Fo�a��0��9���N�q.ֵ��GU��R�js^֭ľ�64�9�r��WMrZ���U��Y�k��6&+n�ōkZ֒cH�)�TRK4��R���/{[V��k��){Zض�kZr����寃X��P�6(֑��!kl)�k���j�ѵkK$�Q� �H#kZֵ���������E�5""!1!1��Y�iD�     4�0 y�XY�Ye�U�Ze�Ym��m��m�iƙm�^u�`~^~�y�y�u��e��q�q�m�\v܁�y�^���(a� �8!�lD�Q6�Ѥ�k�5��;sB�b��"v�n��qvu7R ��Y�I�I�ݪ��1�g�b�s�[uqՒ��G��A��IH�4���e*e�
��jolW���JJsa�D���A`d(�8�r֦d+,��D;�v�E�l�-H��L�GFݢ��PZk����Ur�#G/YEQe�L�kCS.uD��SmSv,Li4U=��[9� |��ͣ�Ѹި���.��vL�õ�ڛX@m:�fc�A��񈾳��GdTI���k��#E�m�Q[�A,e�٢�D�� <c(�>nrד�8�j���]z�]Jk��;A�6�qS;�����["km]Al24Q�9�U(8��	�}h"���F޳qf�-)b�xoL�-�!O]��ʎ�*����:)e�M#m\-J���2\�	ٍU{�#��8�R�Tk��%�&��:Gbm��&ۏ�qگB�W�;Z҇�S*e�xbܞ�H6����h�P+I�+%��J.{R�5�U�-#L���$���!!��������������$�I$�I$�H        �e2���WU�[����H�D�
���M�C���KѺ˓U�9=0F�s�\1�1K������=4A,��<r�=3�<tK=�4R��y�S�;��0��tD�1�LI����.k"�M{D渎���5��Z��i�{)���	hT3�
�h�@رe����#&���m�X�kTnr�)�Q��h	z6gդ��,��n.J���Ӑp� f��]��7�߇8���b�as��65F��ya����ZX�8+kv���[GeV�y9�ʓT�6��n
������6�`�f��T��Jkb�1��T��bbu�K�"�V�JlF��֤�D����ñ�A�n�%Ǚ\�z�b�b�<�k
���y�Ѷ�+I|�6�ogk7hZ3�'`\��cT�;�+���m�Dj�f���[4�*��Z�d���^Ie"�R�������;s���k��.ֶmR��X�u�i!McTӞ�%!iSm�����kfԑ�kӑ�}�C���Z�A��R5�3H�dmj���3ڋܮ�KZ�4�j���4!��k�e5�m�G�s�����}�R.Z'A�%�[Qv�,5f�5�W]�KX8V-qZ��kH����r ����EC"A1!)���Q$�@   D  �q H�Yt�Yf]�m�We�UM�q�q�Ym��y��~Xn�uv�z'[q�aq�\m�[y�!m�]q��u�ށ�_y������b�!u�݆9Iq�EQn�H%�
^�ZL��%Ki��[[w�l�|,�����Y,���TQ�SDr�]�Spִ/\6�����[mG͝�ֵ�ov�K�"#J�$��>H��N�yZ��I<��LH� K���S[tr�bN��j�\��x'3U7؊S���Ewt�݊�V�Y�j��'��K�B�@RU^���a��[��]`��ztR90�ᆛ�
=���!zJ�4�7��a��k[���ԕ��J���d�6Š����[ UƊqZӛ���3��[V��ƹF^Su:S��B��h!Ҫ�$"Di����ل�ĥ��J��{�qM�޶��:4�x�m�����j̦��{yȫiH��4�B�(��^�ta(|��C���AZMubݭH.���y���ݞ������!�[����E��� �SH�4T�ޮX���0ᕶ7+�hCZyr��r�f��B���[�-��g�e4�w��XH�Y)+V��3 �d�I$��fD"""""$""""""%"I$�I$�I �        u�Q��U�U]U�]_=Q��l�ˬ��>�R�sA3��N6���lQUTV뵼�7?�CfME�Q=r�56�-QM+$C��A�̥+Zٱ�S�Tm;a0*D�q��R��31C�P�Ȯ�I���&�Ѧ�#�g.�Rfq+�PcZz�ص�
[h,ʆ�	=M�8�JJ�2ݑ�J���ຳl!m�=-��N[��K:`�֞������k�M���q�*X�#�y�UJ��5�kް���#BƆpnZ5M��'��7���C7*͓�-c��cYhF�b�StZֵZ����l,�2����ƱH�ub�YkOF��#,�Ѵ2��#`�q�L�j����c\K4f:U����*"�j�\F��S4��1�:�ca{���1�r[k]�6ih�'NP�f����k�G-i�8m�Zfٖ#jȮA-9`�ƑN�fֵ�v���=���&�l�5�.Z��yڧ2cl�[f5�m���dsZ�0#�����я5��i ���tN�mf��k����@��M���̳C�66�m(5k@�lD����k[F���[�k�TE�kZZ���5�lHٵ�kZ�4`j�1J<�Qa�&F\#�Ɲ�i��%�k9�k]Ϛ�ͷkC�Ms[5,h����'e""2!!!E$YE�iD�@    �  D <03K)�MfaU]֝n�i�_��]�y�^z	 ~8!��#zI�����7~�~ ����`�!z'����Hޖg��I`����j_����̊a"�bYخ�<m�=���B�"LC	2DD1fsy)1�Z6ɛ�o8��1�B�h�2�BxȬ��H-�h-9o���BU&�-�HD��Z�Q����*���ݍ��Qm�ƼCa��kyG�����k%&_��=�P�������F�I6׮��~�Y�p6��Fڲ�M�xAJ΍�䦦S��Rst���1؍ĚD���ce��D��m�W*�1�&�);�r���+{��P�l���6�TشމJ7,,����
/���-��y���YJթAs�ϓ��ƣn��� o�Q$�׳��쮭v��5N�%��z��1�:��^��4-�%>���/C�sIP�!l�P֦�͵�`�5ե;V�t�E�Ƙ�)��>����k���VR�kgc7`��&2�j9ea��KZ��l�v��E7=c���]u���$�-��5��;$�6.Ӧ���F˒��j�c]����*���3AgD�I$h�F$D""""""""""B%"I%I$�I �        uSE5SESDU]���ˑDۍ2���4�D�C<qU<�e9u�G$�YDs[<q�e0�YC�?v3�q�}5QUuUu3Q>�Es�C�),[�%�Eԑ�mX�g5�P�e�l�e����lZ�� ��j�	馬#��i[rJ�sj$��c���Vk۴�a�����j���nNִ�s[x6�ҵH\�K.�4�#Z_M-�3�xٱ��Z�pk�ۑ�h����ΒCiV�6����q;�Ў�4�vM���%�iQj�ŧm��G��˄u��F��A��^�L���1�1"��L��Vf��S쵭clK=�rZ�uRRҩ� �v�Su�61�iE4ns��̃Y��k���P���)(0�cn�gJN�(ӑ4ԛr�,�9�k\���#Z�|a�N�菚ֶ#b%MT�,TF��q�[$�f3	6
sI7�S*���!�ąY{�#ZB5���%����oK�� �a#6�͢����R�c��kB�Ā��t[�>�ZE5�n���ֺN|\I�U`����85�j�H)�"`5����j��Yl&rA����ظ��҉�Wr�_��=�ֶ���f����	S��S�]�i,Fܗ����[�FVZ����ʏF��]��o�XŹ�������G(���	�Xր�����f2#"%"I����Y$�     @��,��-D�eU�]fVQ��m��~�u�y����!z(!���~If�����$�G�}�a�c�X���~��ס~����Y �	%����If�>Ee�;J�E�U�R��2ԛ0niW*�`5;;�YJ��U���S]����:��تh��՘4�����:�Ym���E�g��]ZLese����{j��stĤ�v+��+0B �#4�pr��˖��h{p�e���c"4A��o[L��5�@}|����tDY6���y��sI�߫K+?}	�q2�$���]pǦ�@�, RS��U�D�*m�Rm)i{���9|m��˝��;�m�JGnmB6�X��Z6�pMk��<j1�,:Kbu3o�U,�n�G�F8C��&�٥�#�k�±�м�+��o+*��o~�یlٵ*X��[H֧3.]�?*QNR#-_/}!��ʏĐ�^Loߝ\T���J8��Y���@B��k*dK��$DDD��&ҹ*��}j�mk�-�[X�ZVL���%s�dr��PA,+����*n��U�m�l�Z�E6�"6E����E�p�ki,ț��u�!��\K�f���)������� �| A�����������������$�J$�I$�        E]uST�TUTSսY}l��4�oF�0I�$E/;�@���4��,��<�L�<1�$��%S]SYe��=UT�UE��f����T�m�ֺ3MD��T��ƻi�$ukU�L(�4�+]��U�R[{2γZ�5�{f�5
Q��,؆0����>a�����|��QY���y�I)aZ֞�<�ZG�����ֵo�E)��H55��[��ǳ3���n ���;l�Nr���|�Z�KZOm�[��$�;���Vƒ/)!$056m�C9�]R�]��ܦ����k��C�6�ϙ�N�l�Nœ,�-ea���k���ɸ��B�m�!�mm(՛��}�K$0�k�2����X��M�"5M�S`Դ�"� ���?Ptl��cZ�����"Q���d��q��Z۸��L֝�3�f�d_�����6�(eSru:$���5�2��T�٭m�ц�#�ҍ浭��>d��5JkZǦ�}XC$Y,�LKA�d�D�kJ���cT�Q��&�%!b4�]�`���D�F��3�U��_J4c]k5m4��#u����4on�֒!�&��4g+O��L�k�֢ml�Y�#^�VW��D�T��40� ���˲V22!!!""e�Z(��$�    0Q G T,��MU�YU�Q`��ߎ'eךm�aq�#��~	_�Id�9%�we�I_����g��u�݅�"��:"�a��9&�Zb�x����ޮ �D�WV�]Z5��P��1e$i����8�MU4�2��0K�*�A:9��&Ȭ�#���#yrOYM����y!����rn�j�Z��� ��[����o�	k�IPRLi,{*��Uuۇ�W��vҌ��BD�-e��JZ���ִ5��Mĸ��+�VR��F�&�z��7N�=:2�g�<�ob�����QnԈX�ro�hmL֖[�z��Z�spk��3�91�)���9�p���=�R�
H���KD�.Ӝo�y�|v۵�
(�^���Ft�Aj���@uI��<R҂���=�X�2��*F8[��
�O\����-�B�*D�,�F��R��ķf���qP��&:$�����)e�g��Q(��l%��nc.�x_3����'b
����F��ÊL*f��Ӎ6��`q^�3,̢b&���j�fKhJd!�"}%R�����e���%&��8� 'I��������	������$�I%I$�        ]���wUS\UD�WE��<m@�r0��W0K��4��-6<�r��4�M-7OL�E��SM$�O5sSU��u��m�Q��[=�+$�
��K!��W$3OM!ZƥTx/SF����Z��U�mD�f�MTUP�L�)��"�2Թ2��T�՚{5��lD霵�KI�6���&�sZei;��ENH�W05J�n�ڷ�:Q੄ě7n`װ�U���d%P�u�&HF�iq�]�M��ф��Y���A]��9����b5���Wj�鴒n�2�Z�,���r,{R#\׺%2-*�;+Y���Ä�h>�xɱi
��e��sv��DC;iJ��6����9����җRI��Nf[�-�M�k �Yƍ+R�m�j���cO5!Js`��՝���ѭ;��ִ�hg�9!X�@�N[4����s�9"J�&�PU�i?��k�!gY��Vh�\��mhA+k\VE-1����*r�*ɷ-Zר~g�i2ƹ��k�sZ�������i4�*&�f��=�����Q�φYg�	|�����σmc�x��kr����c�m�3�Ź�&xi�wi�aW\�i�U
�_R��浬~��kT��0�h��qz�n�w�$nK)�kQ�*��eC6�,��RӰ�)پU��$ph
