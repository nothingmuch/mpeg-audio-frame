#!/usr/bin/perl -w

use strict;

my $n;
use Test::More tests => ($n = 27) * 12 + 2;

BEGIN { use_ok("MPEG::Audio::Frame") }

for (1 .. $n){
	isa_ok(my $frame = MPEG::Audio::Frame->read(*DATA), "MPEG::Audio::Frame", "frame $_");
	ok($frame->mpeg2, "MPEG2") or diag $frame->version;
	ok($frame->layer2, "layer II");
	ok($frame->has_crc, "has CRC");
	ok(!$frame->broken, "frame not broken");
	is($frame->bitrate, 96, "bitrate");
	is($frame->sample, 16000, "sample rate");
	ok(!$frame->private, "no private bit");
	ok($frame->any_stereo, "any stereo");
	ok(!$frame->copyright, "no copyright");
	ok($frame->home, "home bit set");
	is($frame->emph, 0, "no emphasis");
}

is(MPEG::Audio::Frame->read(*DATA), undef, "nothing more on __DATA__");

__DATA__
���D>$�f�w�m�������      �  �˅��oe��yP���2�Իu7qG\��4��<�O��5u�]q_<W�w՝�g\Y��ż�o|��7q��uw��7q��uv�ݿ7�7�w�8u�q�<a�s���=��xw���8�\��/������{���~�����������������ض-�bض-�bض-�bض-�bض-�������t��A}
�OD��6���p=ж�.��P;
ض-�bض-�bض-�b6�-�bض-���/��%����wl��-P���Jsv %h&��I�iPTF�PTF�PTF�PTF	P+�ӷ�S��Qt"�I�LX.��<�CC��ۏACض-��ֱ��bض-�bص��bض";v,v,{�������I�j3�u#]�Q�Er������H]��В�؆6�3	 �����b����{���|Ջ��O0RL�3+���n���R)J�d/SL̵�ʳT9��2C)��zֆ�ֆ�{ �4����H��2WM4l��DrJ/u���$�ЭČ>#�މ�g^f.�L�)Ӥ�8�8�17y�ȱ�|v�E+��C�#�c
�;΋�.�ԌDb5[U�|� ���E��ŉ�σ_�D�z'�:-�����2{Ru�$/�r�B��"m�s)���+�CT��d; ���F�F�{"��(�h��1:��H��-.IHt�f)].�S������8$p�t�QdK�������T���85i�� �,�l�5? .��O'N�;4�R��^8��6 Ib�3��=*#c[�[�G`��)��M�b�NsK�h��Yt�����T��O�ƲI���A�|�m��^7����To��f &Kv�����KA�
���� 
��)6(��V��=s��q�q�\��=��<u�q�=��|��[��|s���\��\s���<s�|��\u�=s�<s�|��<��\��|��<u�sǝ��}m����|s�3�;�y�h�
͢�-�[���D�c��$��:<Z���t�[�ʇ��Z�_����k�n�_V&�VÓ*�c;=Ō����+�!�L@��)�Jn(f�[)1��%�;��?H;��K�I�z��W�
�� g^�	�{0.�v��j�5�k4�9ê�����.t	_},2�L]�3mbI4� ��t�Pf���	L$p&|L�1xg�e��B
M��Z�)��J�.�+�(ST?⴦�ˑ�A�Rͬ� ������8F�����$+¼(.Oī�+M1����zz3Z���T�b�"����I�r��������l
^)�)^��]�&�MF©0�A�jGW��k�����^`+�<�`����k"����}5�Y=�Md��4�I�C���Z&N���Ү���
fH��);�`�p:HC9 �+���[\�'���O4�u<��� �B�8����*�
��/T���6@�J���X����j
�j����1 F$
n60I���>|!{�4�/�_�*�ʤw2$b$��Z�u0JF�vH�v�ffv<5X�qp�N.��Z��yk��[ڷ�����i���y��Wc��;r�H��.�c[����G�֒N��i��+�z�[Է�q�z���(�q`}��!V�y5_�ֵr	,:l���6��J���R�F�c�}L��Vug�c�Ɓq�4:q+r�T:�+!hߣu[��i1��7�  ���d���ݻD  	�K�����(>���<?� � ��~)JJ���a�h��3�x�:�z�z㾸�9랻���9�z���y�x�:玹��}���z�z�9��y�{�:�μ�:�(D(D�0�@�f���[�/�VE��@�*����-lFQ�>.
�C3iON��6u��̰�	�aИQ&m�f���ض-nn�?*2��e�ĩ*��4do��Ū|܄&I�����B��2��1�"�X-5�NJ-8i(2̲��C��=�L�s��B�)A-��V��,< ��+��pz�pz���E�Z�Q*%��8���U��O=<�#2;�ם��~e��Z�P�fR�)U,&�\)�D�D�+n��Ҷ�}f�c��=�]l[F�dH��z��LQ#��6R���"Q�f�����%��!H�!K�3K�8�4���x�-�aJЬ��Wb.ă`�͘8�'!(B)�������h��n/49/49�X`�(%�"��C���ds�)��T5E����b�,�:$�������:�HA��$g������P �O� �����s֥�oy��r�j�:`t�S�פ�kK�K0� �MDo�v�}��phD`xD`{��eu9�FWP,�#P���[V���8�Ȗ�pC��.�D�,�e/��✛H��+�n������:�nA+�F��i�%��Lִ�U1�ٺ+tP�1H�.ױ�l0<Խ���\ՃWSS��S�ט�4y���G��dZ8�&���,B�6Jl�����\��s
����4��4΄4� �������/�/��0�<?�$���t��V�UdVJS��&	z���U{�WD%-�Q��;��ʼ�V@���t(pwf���   ���������� ��  P����8{�^��r0\���~��x�<�x�8�:�x�9�:玷�~y߮w�|�7���~�߾{�9�z�x�9랼�9�Q�r^��Gs�����Ġ�:��GW���/n�fA���ir\�&����q0�.u
�'ֵ��ݬ%aE�iFҎ}GH���Q�6�5u��β�=�z_�]�c�惠��_����I���?�%�9�up�4��8�-Z��u�����	>a&�M��r�Z֣���|*ʴ�3��ژ�$�RV���KѢ	&�I�I\��<l�Һ�#���8N�G	��A���ꊢ�[V�D����X��1R �D����+
PB��]?2��L��D�h�5�{�����8G��=�iZV3���D㮪:6eA0�RM����(�
9i`����!�8C��ns>$�gď�4ѥ�kmD�3H�4M*�㔂]e��r3qƞ���8��:3HA�^��w��=��'��s�9رB꺅�cD�FS��-l|
���ؖI���� {0A
�$�B��[	>�a'ݹkr��q�b�$Id��?�D��q���V�!)�գP!A�WF��Z��A�֪�^��c���^��j�h�(�>�1��;I�t�5Sa�ޥ&�^\R�¾����A#�2&b�͸G��n�A!Ch$(�IБ �X�(z��:޷p��M���!z���Z;��v$��0�1�caGy��Q�yp��ƌъ�5�Y
�c��Z���;��7�2ް�O�/\Mo�2.!��(��(f�͸��!�o>�l��M��i��|��ԩ\w�r����L#S�c2Ƅ{�!ɶ����xm�  ����a3fU��@    W�������*��j��������׌��x���%l�̹3:�9�8�9ߝ�㮹�x�m��y�z�	�eR�!���v�y�Gmw&�Y5rwgvJs��ZV��|w��|�#dY
B��横�}/K�A�|��8�I�/V]\�X]�~�ݗ�Ǎ�<nx���І��4��EEDSD��=�F�%I\gx� �%�o�BP�Q H@��I�QUѕ�]Z��5�f�iB�IkZեh�1Q�iG�(n�EG"���=�$��Д$�Ik`������"$�"@
\ R�! �22����k���׵�~�u�`Xd�v]��>g�Ф(  �1naQ����p�>]��1��wwwkHHA�j���V��Ʊ�j[��+
�Xr�e�$I�uDئ) �Z��I��v�:%i�P�>�1�www��э�l�Զ��u�bX�DQ�m�1cX����o����մ�Jf �B�o�_������H�.�Iuxg�kD&��0 �=dYga�I�a�l����q�g�?��9_�y�$$�I����6��`h@�{��ֵ�|����2���2�F�9Bp��o����m��� @6��[Z��Re$�:������_T��HtR�g9�l�Ų���H�k��}NS�ű|_ Xz^��ux^�=�4\h�]��v�]��iu߉�(a��c3�ͱliz]$I&��c�r��0Q���WӔ惠ꪨ�Y�W���Y�x����axoa#{	8��cD�Fܗ&�X&	�}WU�G3Mt]e��z��,�.D!	���'�N\��+��b��ᇉ,�Ig<#�kHF1x^�l�2Ű�5Q4NX���t]�:���p� �p ���D0+��ݻ��
�����_A@  ^  ^��q����1�b0�*E��Ϝs�q�\s�\s�s�<w���|��<��;��|��<��<s�]��|��=s��s�\��=s���=q�\s�q���<w�mԟoR=��	��˄�ED�(�TM���S�<?�|�ciJ@��rO���XP��%>`�2K��nI�r�Vw�Y�?�H� �d�R
�|Hj��!�a8o���.�32&�����O�!/(��J(�@c��L�\ЦC������{Y-}dp���c���K�Zh�сo�7�X�u�$2�DN�|��4�(ѾSw�)��t��hj����a�oQ�u���s��Hpy��ҙ�mE*Ӳ�Lmlf�Tu{�y�C�x]C�T.�ϩ̅5��Q#]������K�	��Ϡ�ov�M.'~#��򥅙��	cJb�(�<�DWH�+����^�;k�j�zY�m�V�d�+�9@��XK₤+O�:���{�M����i�v��7ZD;�u�C��e��Q��%v��b=�r�zd�ը�]dyX���]�@��Z��d4�}��}>�C_������ҩ"�J��/߾��bN-b��l�#B�an��	ss'��"�'BO������L!]�$����ſ����?.2n�zt������a	�U�+VX��Y�������BC�D!!��Դ�<�KN.����V����P��IP[�I���s��(d�'6����n�ͽ��Sx	p���7ԁ(�}HO���?s[7*v�=�D�Zk!'5%���9�+����Nl��ڶ467��[�	k�rw���'~���i1O����4I����d��S{J!��R�P�p�F���  ���T&�f������  K���UUA@��� ��<q�pS��:N���=s�]��|��\u�]��u�q�\��;�<s���=s�\����=��|��<��<t��w���RYY�H�#���)��,��4��|�x �@fS;2������$�V��ֺt94絋k��(7|�JQ�)G-L��2�U��`mc�k�0o_�z����j(��T�,�\�O��I$_$��E�V�wIZ,[ ��l���G�<��j�CW���u)kG7+�j���R�管{=z/yu�!�M�4||��=r���:�)�0^�����7-RJ��%a�N�c��%���.���ҷEn����S��c�	�]��9vnP�5�Q��*8AQ«�5]�����ݛ ��6��I5��/��.W�����q\
���N��Y�kf�-��m)�yMۋA�ZO�;	ߑ�Ű����o�Ȉ�˃�M7ɢ��,�q����*3��(�Kf��4f�����j�S�j�KV�����#��ܦTv�L�T�E�����L�493M�)VW��Y>E��/��|�}��.�Yt�p���2����r0ٹʚ�:dt�]7�K��Ӥw�N��F�A�#�yu���~�Wj�Ma&k	(��.���-]@ȡ�n> ���S�31��lƓ9��
R���m��mIk�K^��8���Y~��V�ȯ++�\�Л�Wp[��)P��*�
�(P�����c�.	p�E��,g����~ٝ����i-�8v�7pA������5O��M��7�DD߉xۉ)�n$�?�Y�R㸗�[	��O�Vo�[s�����]J�'�� ���dk�f�������   %��ꪪ��@   ?���8�8৶)�c���yߝ��:瞹�w�}�ߞ9�x�9�8��9ۮv�z㞸�y�x�~w��5Qƚ�8�]�#�w�
�X�}c¦J�2T&ҍ�<���v,��e����@Br���|��#fg�l��+�����(P�X�BtkD�ѭwr������]�����ظv���@~���qֳ��hɶ�&*�U�j�ڭ_;Y���'��d߅W�~^G|�;�1.B\��_5��7)����dg��M�<�Llh>s%m��K@�	RP�*JS���N;3��!TSϺ�}��b��=������O�ӝ�\��[32C�V�Bm&ZL������jyԥ��R�]��Yw��دf�gXΰ�&�y5?p����~�������8@������C���"l�$M�U`�eU��VR�YK��Jg*R��ɬ$�a&A��e0��&��!{C�2oC��;��_�>K�`%����H�kc�I�ʉ�TN�KF�v���3쉟dG,�`�~]	�cLL�;�B�O����s5U1a�lņ��g��A�x��G���IJ��|hi�CN=���A�;ѧ qH�(6��הx�:��b&y�,��fР��B�����=�{�[e��'����Śv,ӭ�-ȑ,v��Țq�#pH����[�J�o�[��eoC��˖.\�t\�5����՟V��^/��{HA�G� �r�FE+h�ѹ�(b9eJ�S*�MLt��w�X�kFCZ�'E��.w����L�Bdj�ʱ\�Kb�aWJE�{>祬P���Oi��=���aG�%������l�;`v�e{(vjгV�z~����
!�4�A�n����to�f��������   Z�ꪾ�(@ ��7ߎ<�����s!�a�8i���~x�w�����8�:�x�:�8�;�9�y��n��ǅ(��l
�0+�,V��QZ��]r�7����w��w|>�����?}�eQ�&"9P���Z\��Cr/���V;mXQ	{WD%�Y��LwS����o�b�K
XP	�o`�s��!y�5�I(�Q�3�YL��f�?�,��Lg�I1��$��g&;6�1�Q�Џ!�y �H��'-�:M��\���ԇ��1YK��e6��T�c9M��b�������\J�T�R8/��|�QXʊ�����g�kZn�dJ�]�+W�I�_a'�)\aX�q�r�ӕN���_>�@@���{�K�z���$f�~�5M��?Xt@��u&{ԛQK>-E,���YD��j.SQu�>Gp�;/��O����(E�����s1QR��Gi�5�_4�|ӆ�;�7�����Yv̑�䍍���p����?v��]���XQ�侬RG*^\���Ԭ�{R��/�D0�i'�2�����<P�ℨ��E4������
g�U�;,i٭k�̚�$;^�Q6���l{��)B��P�U@b�����~ik�K����%���Ͳ��W�Je)S�Md�fA��!�h�,�L�=9l̴�2�m|�	��x��}?Z���ۅ�.��u��oVCz�+��^*�xE��.<h������k��!��8�jX�F�������.A�0U��!�L��b:���^s@�R��z�"��+\-���C�m���i>�M��&�iLR�b�IC5Z1��;�߸��p�H�f�=Jv�����f�����Q���     V������(*�꫞y�y�8�y�غ6.�F�ѹ箷�nv�}��T٩���	��!5|t^/����;�}so҇~�5+�)\�fr��d�3!��6̩�g�?|��!D�bD�`�U�K.�FT��ʓ9�c'>,neύ̹�9�9�l�d��=�3ػ��ܡ���R� �kHF���t��|�,�YGJ���Y�M��A�8�A%�$�A��햿�}?C���+���`��mlckcu�������r�	�mۜ]8�x�y��4���Y=[�ãs8t��'t�>V��NN�����_�*�qU[��Xf��kD4h%*Nĝ���g��L�QUrJ*�Fs;��gvX/`�{�X$B��N'	
�Uj�5T��`���9��ϝ:���Ue�˲�7�QF���ry�.��B�W��������G£�F������:����]�fo[3c
XCN���ѯ^��sy�;�<�r�:H�gI�ݬy;��b�3AK�B\ri��(/�A|�8ҩƕu/�x����^��.R�Tz��=�G����!�dQ�*�0�y����q]���/\[����c?�����θBklX|���'��w��ג8:�U�!ʹ2�W&^*�cwS��@�Bg��{�Af�5vlѳf�N��v��9қע�h�h���,��|u3�N�zih!t�.�19��<U��c���]IR�Lw��mj��T'!3��P��r�jn�ٜ3�O���3�ߦ��l̀,�`��P�z���7|j +R�z�k�T��P�E�!X��GH��=ȴ��� ��d�q�,�?eQ>����P[R�־�}�B������*$�Q+��_w�:�c8@�B��@���D�F������� 
���UA@ �  
 ���<q�<�<o�u�q�\s�����2p0�)�3�ϝ��}q�s���}s�]s�\�[���y�^u�|q������=s�=u�\��RpsRpsKX>ʵ����&� H"oM�k(��f��2 ��(�sG�8�d�b�����1V^qMqF6�)�ciB��E����Z�z��:� Ӯ�[j&Q�[2t 2@7��5��kn���6�E�Ş�Ş�E>Z�S�E���
�(� �sasE�64ZU4����̸��s"=�XJ68Us����}a�ѽ�m��nw!h�gr�f�,Q��b��(&RWR�e%t���=�Z�c9�৏�ߔ2J��Ș���r�l��l�ԅѕ(QmRYv���j�8�k$�f�O���}�:,�Ԩ�G��3� �.�>s��@~�@~�b���-�ؾ��)F�삔m�)4t\�GEi�Z�)x*b~n���hI�qF�kjQ�l�Ċ�j��j�ֽNa�k���W��A�x�R���5+��9y�XF�5�B���p/?Ȝf� z���[m`��`����� *��ږ]=��e��)�F9B�c��!e󚹤\��~���)�4��?�p���,zJ,z]o�-��XR�Ӷw�;gp�����8����Y�}�����L�ڄH��:��&!Hm�e�e��X����6�m&Ul��e\;3�ó0���ŬU�%�n�m�6X�b�봛!u~s��z�TʚT�36l�C3f�4׭�TMz��C	�氚@Nl��cL{qC��&�W���fV�VrDq_-������i��Jf��n+ݶ�A��{P��7��7���p�Jؒ��&��B�TA���I
e   ���T�ϙ��������  *�K�UT�

഼q���|w�<q�q�<u�[���t�]%WC1�3���]e�\��<��=��q���}w�|��\�U!U E��b"�±^� �o[�B.�N��I'd�Fs�3�VOz�{�V:���RYj��36�c��BUɫFNG��G�x�aM<v���ŋ������Ȩ��dU���T�Ŧ�-6�:wi�	��O!p����Z"�"R<�<���n�Ҳ����@Q��F���#|Ju��֗&���ދ&21�D��'�d>x8�uV�Z<������Y����h�
lD�c:bB1�!(�	G�vУ��,�qg��T���/�PG��V��A7A7C[R4���JF��e#Bk�&�JO�w�#��O��q����)*1IQ�G��<,7�s�*�,�.��;�a��a�tP���(TM�=j&؞����,�K�9�9ϩ��]��������ȶfE�L�a6,l�=�nf�2�����(�/�F�%l/���܉���D��?2I��"��y��ONB�����	<����ɪ�s�q�����<��?����eh���g[���L5̈6dW�&�I-�/^�vie5\�ģģ�<"�͞l!RH6�$� A�.�Yv��v�c�j�U��-L�n�aKd+T��5��ir7��7�Ȧm|�S6�qҢ��Qt����EE�j�Z#
�:<����"5���Ɨ�5+��:�k��!��S�T���JJ��&�y�|���v���;K�i&h�3FРf��K�2_6H��E�*u� �-��C��#�#��Jr`%9%������5[�����P>R���V�2�U���M:h�435*�[kD�z  ���d��w�̻����B�  j��������y�}��}��8�x�m��t��b�-�h����9��z�z�{뾽�g�TK�Q/��Jk�u%5�[Vt�mY�h��F�a�M�lK��]_.}�s�^P��'�x�5�l��lL���c쫱��b$f�13J;c�(�-p�kj�KW�B��U��ʇQd�Y=D@���$-�3ُ�c倥4.�к�m�Ut��*��S��UNg�==Q�a����ԭ�H�RFj����<��n[��n\���n;\~����+g�	{ㄽ�lO��<2���Wʦ�a5�۸����-gij�"�����jضD���j�u�D15���׶�����fR�u��}֜*�P�ct���iݫN�e`�+�3���XkS�d[E2
҃4�L��]3��տ�������'V�4�[D�'d������]}��Gf*;5�E5SU4 ��n[h�4�]GQ�B�,aر�.�:`�{9��p�'"$�1&9Y2�ɔ�7^ٺ��خ�Yv]�2�ձl[� �%%E�ln4U���Vl���~@z�����l_Jb�Q�����������e������iF֭�c� �3yoj+ډ�XQ�YaG��^ǋE/n#e�x��-p�3��Ƞ>H�`D����ȉעu�r�%)JR�	���7�M�4t�8��8S� )�9��3��uL#�a"#����\�m��m<N����*5��kHMs�p&x	��%Ն��V�Z��ЭMYW���^�ᱟ����E�A����ƍ 4h�Iv�_0�	�DQ�:l�:7�m�+�h�~����Y\�鬽R�uK�yBKX�ajSWƚ�4��8]��h{�lֱr\��%Z� ���t��w��������W��   *�����B�x�z�9�}��8�8���;�N�Fs\����f�١w0vgf��[rk`NP�)GC����="	�[@����Ц��%7�)S��BքdYAűJ���P!`�-���@Ӟ��Vz�iY��l�d�s'C~r��٢��=�[��N,�V0�[VЌ#[ħ�����<�G����q��xv�q��l��e��b�Sd�3%9�v{�<`��AN����l[��oأB(�5m�ƭ����5���<}����P����HqC�i.;Ir�ִN��Z��c�G.ka�l��0�3s��xd�[��+t�p�`�	�Թ'oR�CT�W2���٢��\	S�J�6Й�Jޕ�sR� ,%����#%�Օ�Z���)띅=s�f�Y�/��xm�ϯ&}���W��&��𞇅ʻ�u))n۵5M�,�+���#��,y��b���R���8��0��p�c���p�btsq]+��nEqr+�-�[N{�l[,�5�w�kz��y�E5h�Rp�JN����*3�����6/bC�w`�;�K��^׋U�Z��v�Jc�l��q�f�!��h��7�F�$$wĄ��؂�cb��u���5<)��G�*<&t�3����'�1�uJ��kB`�,�%����cbV���|��י�z�_}�}�3��YN�����LŪ�-TҴ���7����Et��8���7!Ȱ�6��cbЪ7�F�t�
�!^�mxrٵ�3ZQ��UV:��2�)����tE�QKb�\��qX�l[ű�yZ���W�)���8�!S��*~��k�}���4�q��TE����������Cv��(�Q�[�LS)@���E,f�������d�?�@     ����j�+מy�8�y�8�9ߝ��x�|z_�q�z��B$�<�UG�J�V��j�SAM�()�%�F�"7���T�c�A����ƧN5:q�
�ª���6��5�lR��#j�ĝ�8���n��������:Y.*�q[�!]y	�h�@�o\Sz��T.b����X�)@[�ZM��3ga��(�Ce�Rax�L/FS:2�n��t��}��%h1+C"��YiZI�^��l,�(Z)eJ�:lGM��C[���1џf:���'�>>1�Et�+��1�y��͊�lVx�� ���[��t����q��i�7�4�KK"IiEH�S
{гޅOx�(^�B��-�9m|g��<I��~��ֲ̳CPձl��6Pl{Q�oj<n ~v@���q�n:��&��?�Isy+�ɈJ�BVG�d=;(dr>}�GQ�B�FѸ��a���&�9��R-1jEϾ�����׌��}>���l.�ax�ZǊ�cȓDͽ3oDH��m\�7��s��uJl����T�=&���(���[�l-�am���dV��H�G��,(�K}[�Yk�<y�[č#$I���*�t-_΅��bs�LN�2f�L�5o��}^�B�z=P��Ha�C��঵��nt�(�[V�B�k\�9؇��0򛥄ʱ0�V%;���w�ĸV%�F�
4�ck�^0��8%H�*E�}�_�Η%�յ^���jZԶ��ҁ����M�iE+$h�d�w�K�R���T�Xx�����MH��.��vo���u*HK�Zֱ$IkK'N�6���Z�U�W��N�I��?`Q��VDB�$�	'@B�Z�����V�-�z�B[���l����D����������� 
��@  ������o�u�{�����}s���<u���=w����<u�\��=����<��Me�Yp1#�c$X�uO�S�=q�\s�=s�\��y�TZl4Zl>U)�(��S�Q�*�o"fUD�DN�d�����)谑�U9�(0c��c�Y�a�ܶ%�fQ n� n�X_6ư�l;H�;丑�w�q6�Q�n�d��bf9�?�5�x܊e�&��W[lhU�:>�:>�=|�Cz�:$�Xڀ�f��\δr
WkG �s4����r3��o������w�6�����%�y��y�W,�(8�Y�Pqu{����G��I�Q�t��^_��=�����UN���?~�4[P3Z�19�9�{cr�8���Xu��?[��Z~�W_!u�R��U\�r�;~(W_Y<�oR� 0��F��b��b��L�3R�#Li�����Q��J�ȎD�<����]��SCG$ݙ�\J����`�n�mu',{�	�	�V��uJ�	,�-VҲ*Z��dCS��|5<�G����&ό�Zr 8h�,�;���{>Ŗ�Jׇg�gxF�Ǯ��u�p�=0�a�za�&v�a�a��jKGs#.3��6�A�(#$��L��,�G$�������뵣�)�kG�)7Y�oRn����0�MN�T�Ϟ853�r��W7����A�UC8<4[f�SݥF]�Fg���ς��P��F(�IIϤ�@L��T����I+-��~~��[ԅ�H$I�mr۟*۟*�1|҃�b����i�,7XԪf��ʦoKKfʽ���f�
 �Y��HB��֑��t��t�������	3/�?�;�:�w����|Q}H����!5�#={�B���F*RY��$ ���T~�̻������  U_T��@ �\q�;��]u����q��q�q�s�<��\�<n�9��P���&`�q/\K%x��D*i�4����N��7�����{A`RO�xF�B5�1LՊf��,=ia�:�
ȍ"Kq�J�-�Ӯb��c�z��ӽH�m
�M�+݋.�Vŗv�>�q�[�e��-v:����(�F(�`�-VM�u��9]�6��w~k�6�՛s3��d��q�F)�t#ö�з~��7��p[;��񾍍�e��.��eד|�`y*�ՠ�� mސ6�ogGX/�`��~P�r?(d�;F��En�+wʄT mYh�����Ҵ��)��l#f��Q�Q��˥�Ne�˖�V.ZeX�Ү3AiW��rv[�����~���z�����V��ʊ���ړh���RL�A�<
�ўEjߴ�~�܋ŭnE�Ҿ�U��X�򻂙���,f�b�	�4b��Z�e���k�����Vz�厽br�D����;��_��/�ݛf��4�eb�+�T7:�E�B,ZZ�5q���J�+�*F��A�D��ǢI��.g�t��y�љ��hӘZ���7���D)o�K~@���ME�)(��N�ԗW��sv6jp��}8q�>p0��Æ�S��k)��6�%��/x�3ŉ�zDK�-�r�s�[�Vb��dٸ�R4�/�17[�qp^�8�4S�=QO@�a�'P���i]kJ�Zp�Ӆnv����"[��E�%H��Cb!,RD5�����x�N�<@�vT�ݩRsv��<����\؊u'3�9;�1�Q�.��tUUFG=~ �)n�ξ"��	>�E3�l����D@Y��*��
�m�5�����؆/[8z��Fg�3=�2/�0�b��[
�����d��U�����������  *������A@7ߎ9�y�8�x㮷ߞ{߮�����yw^F4cO c�~$߉!��ޮ�ޟ��_��rc{���jq[S��s#����s]c��tT�����r �TO����ca^� � ���ݝ��J@�,�0�Y���r����;_	�QҢ���񶏍���h�^�Z�yl[T��Ke��b��b��lH߬HߍYZkd����.O��-��m�h�t� ���"$)\���2zC����V ������W$W$]
�
��~���=L)�a���T�7p��,+)aXz/��~�
e�S0�̆�bƱ�޶Z�Y鞑W[�W[�cP!cP
A�S�9��ͥ�l�KfHE�B.��Vy��M�:fC�20����d�>���E�Yݝ��'N�'qqP������0,R��G�欿5a�N��t�*�1W-}	k�N��t�LS�� +�a:)��)�ӖYӖY�O+q>U�KOZ9uM˪hfDC2!KH�[-�h=:I��P�b���W$��k��E$a1��1��\\7�-��[��=�i�X5���e�3,B+�]��-e����#!i��\>��கaVT�T��؟�خ�ox����\(b�CQ�1����O��}N�p��#t	� <q�3z�� M��$��$��=��=��d��e
%�Q-9���6lǳf;�������'<�!�i$�y%�{� �6Z�9*��*���(��(�^�[{D��e-�2���2���m�E��-�r}k��$A-"	j��V���x��b!�_��_��.��.�⬿�~�W��������IN�L��eMbl`��h'{A1Z$��"��n��-�I����t��C����������@|  *��>�������7ߎ8�~�߽��8㮷ߎ:뮸�}��� �8��4��G�JT�JT�C�"�tp���6)�9A�X�ܓ��L&za3�8�!�Z����|^�-�cZ(�lZ�Q�c��{��{����/�ђc�/��|7֐���*��ַn&D�2%>}y���g�k=��<&i�ֵK[��n�OO6\Y�⨕%D�+��]}�$�!$i���.hoCx�bGK:�KUJZ�u�r���S�e�R��$H+D�+Dƞr4��Pf��JҺV�B"�6��wr���ٸ��Xnass��|�*�#h����2|ɓ�M��m��m��l}r��ԾF}s�Ç8ʠSU���H�"(/g�{=���6Mk��.kT�-��j��"��"{У�F[�2�j�gVs<#����fC12�1�K��\&wⅿ)�m�PQָH6�m�T,J���v��v�"�1�[a���0_9��&�14�%V*����3�+�!^(l�CdhԴֵ��$�m���E]�L B� B����M4i��e7�)��X��(�yGW�ؼ�ǝ��nRsb��-�dw�b�1!5UMt�k�ȫS��S���m�Å�\/Z�<e��N�.t)z�Ж�iR�J���Ԗ������I7M�s��$�nԐN�p�[K�[K�v����7�a�B�����5��c;��O%�y:�A�Js����������S7\�P$�������&�i8���6qF��4�o��}m�h%�}ȃ�I��LC1b�7�y^�)L[K4Gի��\�E��E��n6[q��Eg�,������tN[�i�kL��[trۥ�].����(�ftV�k��� ����$!ww��������@�   ������h>��x�8�7ߞx�}��;�����ߎ8�<�!�a��^���t��&�V��mBKjT�����@�P!Җ���2'��<!�X��żwM�z�ض�N�s��l[!a��uw�I�FCU��j�sV���^�z�)��a�LH*gY�:��m�hu�z�S�l�z�kTE�q�F��e�Ia��P^ڋXИ��h�b4L��e��˓\��V���ҭ��o��i��kch�Xښ6��:΂:Pa҃��\À�	�"eȒ��oIr�K���z��u��p\AR��k@0�g����'`�(+���ך���n^�R�җ����.VYr��p-���0v�:��֦[��m6oZ)J���0K��ن�a�#��Lճl��n���%�t�+��k�RL"b}Xs��X�8�(�TccB"��ݕeE�zq^�0�1J��T��N��vﹻ�C**Qb�}C�s�;�����W=D�%J�9�F#���ڡ��u��i��]5Y�R����̴T��2uè&$A�"{���v�Y��-F����R� ��D�2�A�ba�ig�Yl#�aj�cV�79���'��Œ��oł�,בƼ�|�K��FQ��kx�RkVŰ�?v]ţqhێ�#�aCIRBJ��:�֮i����4���Q_"����TE3
8�Q�Z��%v���Ų4�1)E�hy�f��o=@mjkz.��t��G"r1㑏%.�)tI�O�v]�g��9ί]�!ű�h1EV�U���)�K4�Y�B�t�+��]��	y�^}Q��\Wt⻧������4�!�%�Ʊ�]�s�Ű, ���Dx����������� �^��@���=o��o����\u����<u�\��<s�|��=��q�s�=��|��|y�u�q����|��<s'2r1�A�)C����z���m��iQ��4����)́2���ĻA��]�~�D�bЦb=����F�4Qvv�R�<T�rylqSVv���'�$����F����i�nɚ�
��bN�N�-$s%����-�V��KW�	�Sh-��z%̺�e֬͗F�˥EOq�TT�s&xA�<!Y�h�`g#��.��"�W�,�YE�-�[���JL
RD�gB{3�ÐEP�9U�W�c���Te3T՜��Ъ�Q9�8Vk�v�=l��,�`I��Mdu'��:��g��!Nh��<�]�]S�f��(-�o��r���)ݯ��eJ$8C������J��W&|m�@�6��^M��U�߮e]Fkw�5���?G�'7es$�ж^!�����B��L�+��q䋎�\V9|.+�"}���'�kϖ�J'�D%�uݳ�F�u��cD?E,CyPvZQe����"�iE�ޢیovv �gg`����TmK��7.Do�;WѼ-W���9������j��j1 Q��W�jϫ�4̱(\����.(���H]�%���LV�Ʒ�my�|4�Fq"���[[�����yY�a<���[E����_����D�Ca<[���Ԓ�r�ǁa5�!���NVS��z�+��]����)����G�O~��ZWQE-+��!m�|�.�y}iZ�z�-��Mp)�E�%q�ș�g[8��"��RJC'���yz�{w�D��"B�Q�ZuQ������`���P1r7�=^LA
[���R ���T��f����������UUUT ��A���q���q�<�;�����;��<u�s�<w�|u�s�q���<y�s7p2#"`��mu�O�_D�Y�l�1�l7�����IՏ�t.��w��G��<Sp�����X?��t���@�/�qe;��	���������a�YiY��PRL��c��đ�c�Gs
;�Vji�I���WC_t�w����Z̵���b�YjY��K<�F����S���E�o�xS�L��g�U>���y%,�l/��������^��86�J��\]���E�KzM�Ao��ǔ�� w��h�?=�������H�ցb���5�o�C���������E7q�o�3}�~#�l�d�ѳ(��CS�L��)�@$8'K
\�ilF���r-�.E�� �a��������f��5�Al�d���lg	W�J��"���仔wwc�ّS4Z�M��-)�k:-`*[R�KjR�ź�bo*�{W�۪��V��;��Y�B�2�xa�ق�"�|:%� c�_h��,��咘�RgJL������
��T��� ����wXu�ï�m�`ǌvFV�)��j���c�ǡw�.��k4�f������*#��_O6�y��8�h��(t�L�8��X�5��F⬍JE���.�E�MG�����`��%�y.���>a�=�I찃E�0�\\�	�U\��5M�޶e��C
(�!EC���u?�f��sW�j�cUG�:>q�5�1�9�\�b�c��e3~9�B�۹l�DP��X�Dh����2����
�˂b\JPbR��X�C: ��7�'U�&/�q$R��B�-�����d .3���������� = *�*�����@<7ߎ8㾷���9�:�8�y�x�{玸랹�z랅aGX����f9���V���o��2ni�O5`y�-dAk A�X^z��æ>2�eVS*z���n��Jńh����۫i][J���V����+�Zv��d�r�\�U�J��6��RLZ�b�A)	S��+���$�
f�S7�Ս��I�*M�W�'�Y?)}�K�f��Fe�3.�zR�Җ�dxB�hCp�lYD$��0I��T��en#D�$��V|����PF*�F�C�0��/]If��5쮝t����x0>�r�"���a�ֆ�,7JǠV=��Ŀn/�x���GΧI��vC9�ϑe<�)�a�P&6�Y=4�[�Q�F�
1��T�`m)��Mt�C^r�ܒ�%&�y7���@+,2Ya�q�+��>T���&����6�h�#G��<|���]��lw���6'M��m�Sq�ݍ��ˊ>\Q��.7AYH.�RNZĆĢU�*�T��Ԭ��u̓��e�5��[��뮇� =���u|۱&݉X�j�k*��v.�܋e��Ͱ6�0ﱎ!�q`�c+L"a��y����ռD�����8���M�zo����H}�Pѵ*�T�"���|�3�x������Do*"�i�kN�Ƥ���9w��=(�@Ϧ&}1A2�	�(�=V�ʺH��*��X'����.1c-�nP!R�	sH+�Al�[4�.3�q���=dI�}�K��\o"�sT����5�0k��.bYs����h��D�����l��\�8�.�9uX����8�,X�b�,C����R��D ���tH�www�m������ @*��������<9�x�9��}�x�7ߞy�x�8ߍ����F!Q�T���V�իZv�����k��]�d��/`JeR�T�G2�ƽ��Nd(!@�m�Kl�0���]WV=�=�bض+�8 ����h�j,Zyf^Y��FeQڌ��:\
��.��wg�}>3�tAK�
L�`6��%�kq�g=�< 
P�@6uM�w%�F'���zuޝz��cQE����d��
n�S���uMn�]w���mC �A�gĬ-k�9P�T:V	Q�Tm��h;�>��n��G*yʞe)�)L������^>"�wL���d��tt]�cBϳ��cR|ԟ�d�7ڍ��.�ȕr%\i�Zlُ�L}�h�X��Ǯ�Ą�%�r_�IGQ�LӅ��ZyV�Tн4/�cB�F�:F���8�.�!u�&��5�I�L��&(1@u�u�lb�յ[Ʈ��V��[�V���}�Yn�[��!�]Y�V�d�Y7�0?���t�q��P��\&��Ե]C�[�慡�"���s	�ES�T�k������zc����'`\����0iɃD*�!T� FI2v�q\X�4i�j�-g�a]aX�ƪ���y�Ch|�%18N�Y���,i`������xIM�Je%I�a�f�����s�5)o)��f���(���-{F�^rל�&zI�d��%���g354l��f�6u鳕%D�62̵iZEQR�UZ�4�D�5�Ix��o+��E�����fi��M����?5-��n"i�I^Wn۳LӅ�u�}�ؤ��7e��wX]�g)�D�������%dj͛Vl�.��tvR62��
w�S�o���<��e�qZֱ-��� ����fww�ݶ�m���T  �����������(9�7߾;�y�9�}��y�y�wߞz�c�E������m�n8�GkQ�͉���>'���j�*���C$i^:W��\��bh�!x]�`RıkR��1l[ @9��e�E�Qa`�X";�w���#a���~�xm�I�Rg��~�_�'G5�S��^W�!�k����lt�s�r>�ٹ�b��F)�S�E�3mL�P�P9&a�y?bOح��e�aXRd�{ͳmFB�*J�hH�j3�g����l�5;
vz*�j;��(b
q�m�I}�_]�qC�+eY�'F��s�ձl"H�ψL���Ѕ�!}hLZJ���ک�|U��gy�Yq�K��'�;��E$I�i{^ꊠƜȲ.G��>kl7�o:yN�Y�ZwVc4�i�)f�}�nJ��ln�ɩJjR9G��n۵y^1F��)�|��l���.n˄�'D*�U����.m{�_4!�k���9X�V2��Z>յmV��!HVűjZ��r\��i���u���bv��f�V!BS��� �H'��(Ε3�O���$E�~�������E��t����t%	A�c��㵨�i�kR����=�h�Z&ܔw&�d��+�z��/q�ѤiG�����F�)cñ>O�>R��ɭb�X�RcL��<�y���_F1y�^Z<��9n�j:���Y�<a؁ HV,8!]WY�n|�����K�R�mI�Rv��8�q�6����v4\~W�ņ^��ycX��qjZ�h�HKYl[c�0��V�]��Z0��m�ۯ^2R��*�ʮ��`�|o��'���$C��ضl�7ǌHE�lvݰ @���D*Ew�������� ~�� ���� ����=�����q�o�����=q�\u��<o���\s���=s�q�\�לu���=���q�\��u�w�<s���<w�b�सXō��B(a"H�2�s�ʼ��^r6xt����6"P&�&ᮥ�V����s���*MP�Z*F�D$λNVe�e�#JԌ"%��������*c��'�U�Fp��}���ct�lܖ(���S9*詰�������c}8M��!~�z'�-蜧�82���ĺ�c6��LT8���@��g]EZ�.`VM��'�J
f�ٺ�kc`���-v0�Y��������rt����Gܢ����Xu���#�:����rDp���1(�O�� ��e�Y�|*D�*)�9���'G^���Zduujk�����p��m16�e�lű�*mJ�ť�����if�����EȊ�"*S�<��fd���Z�#g�K�6��#~��/؎F�e��}���K!s�,��47���Jѥ{+F��ш�R{Y��U'��)	8*�G�xjn�V�~_ԩb �Q��em��W���^ij"b������8>���3ia������jQ��k�Yڛ�~��Fj��Vj�i����,�S�Z�OAn���\R0�l��5�0��\63��&o)��r��>n8���	��vAk�aUG[���|�y�禱Zv�i�O+E,�h�D���Zr�A�r�x*�I�̺�ڱ�ja�k�X�!T�U+B�j�
���o���{s���r�]+*A?�[~�M#$�ci����@�BDi
��yX�V:�y�S��k��]�%�VQ�9YF[t�hl$�:
iʫ��h����f�'�lӐ��e\���T4C���������(�UUUK�� 
��q�q�<��=o����u�s�|q���>s�\s���]s�\��\s�q�\u�}s�\��[����1OS�@��w3��F맇]<4��ԧ��������}_3���o�<�1�1�Q�Z���X6N���
۾��4Ď�_�pZ͂�k�jC�jC��Ӈ��W��eY�*��;;���RĢ�!WzMMr�{����	F������6m��D��&~�j]�j]�f��f�����o�xFR�f��6x�3�p2��`6K�h�9�g��Y���6ֱ�:�:���Iz�Kח����%p9,�o�~���n)E�
�6��i�T�ܭ#�L�2t0�f(�I��I��??��=�i�V�*�Xz�C�A�:��׃Cu6	���ES�f4���dЙ ��ƥu�+�:9:99$0�$0�Ky�[�Ҩޗ��<�y:���n����[`c^D�vm$֨��=�d��?M��l	Q�Q�X�X�Ŗ�,��3����o��F�"4q×�2��>�i�:�-�\e5�Y#���jͅl(�..�..ɯ�	����=^���e�R�{e�QDr�.b+{����ui&pcQ�W��YLԓ5@q�	�ɉ�ɇgq�gq�KRXz�I�M[J2�Q��J�rS1��mQ2G�٩/�Z��%�Y��llJj�NV*s��;��=k��k�����4�s�����h�����-�חr� [�<���"��8������Ց�}��|�Zp�ZqEh�+E�-�qO�r}���Q�z�����!�c1Aj����"���]�e�8M��o��s��rz�$z�$�d�'@{f�-��l���4}���$MB�m���-BG���
