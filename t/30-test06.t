#!/usr/bin/perl -w

use strict;

my $n;
use Test::More tests => ($n = 27) * 8 + 2;

BEGIN { use_ok("MPEG::Audio::Frame") }

for (1 .. $n){
	isa_ok(my $frame = MPEG::Audio::Frame->read(*DATA), "MPEG::Audio::Frame", "frame $_");
	ok($frame->mpeg1, "MPEG1") or diag $frame->version;
	ok($frame->layer2, "layer II");
	ok($frame->has_crc, "has CRC");
	ok(!$frame->broken, "frame not broken");
	is($frame->bitrate, 384, "bitrate");
	is($frame->sample, 48000, "sample rate");
	ok($frame->stereo, "stereo");
}

is(MPEG::Audio::Frame->read(*DATA), undef, "nothing more on __DATA__");

__DATA__
����jܼE4%#!$�@        ��L Dӎ$��j�q�k�ߍ�ߎ5۞x������y���|�9����w�=瞸�����������>����'���ml|��o�ֵ�kZֵ�l 0@! @"�T!��	H��y�[kc�x|�|ֵ�kZֵ�k`{��� ���.�����9�% z�N�$OG�`�P�B���u�4�~h�&リ�8N�s�}��YF!�Q�$�N7: ��{�����/B��~�ۃcm�����hz��C)��go?����js����.o����@�_"�8ih�JT	�*i ���$9��0���u���NM�ask�P��&� X�6iH��:��]�+�]���Ò�!Вj7q)滑�^������$n�g݉����s��������&E�w�}�G�:�P��@�lh1���5D|��[�R��f^���I���W`$�즱0�#Y��vk�o��)�.��T�.�Q�(��f�AS<ۓ���WDuhbר]��|ү���IG�W 2�ΩG��-,�ָV��뙹x�hJFB""""I$�        ��8 ��IU��
���q���k�<��;��=����=��\��s�;�Ǽ��\{�?w�=p�����������}��@5�O{�}������6�5�kZֵ�kZ� `�B �D?�4�C���s����������kZֵ�kZ���S��{��]sك��>sJ �|�DH��5���(�%����i�5n��JM�Up�	����䲌C�:�$"H=:�nt�����	���^�H��_����o��$����(�S[:��.EP7B��GC��\�!s����E&p��+���6bT� Ym�XH..sANa�">-a��w586<������<�62Mr �� lґ٢>uUغ�W|�]w��%�C�$�n�S�w#��	��UѾH�$6ϻY����Ãh�婀L�d�f��@u
�ɬ���cIU j���� �����*̽�,&&5.�m;Ȯ�II�MbaXF�h1������@9�S�]/ܩ�]*�RQ[6͆��y�'k&����ůP�;��
�3�_,����N�@eS�R�o2ZYA�p�\����>Y�̩1"!$�         4�%���d5��m�Km�׾5�}��~5ߎw۞x�~9ߞ�ߞ9�6���{��?)d
.��8�j�d��j2�� ���~	{J8�*��!cH��&�&�S�ā�_Td���I'`��L?��z�؋ս���P�ۆd-�M�i�;�V�GS��1����h�Ҋ jƶ�;K����K���I�RN��ΡƱ�"��,z'7U�(����|�>M�l�v���=P�Ncb͇w^��a
��>�_��oM�ǡm{[fX�T �f��4�'#2��Dګ�O�С��Xy��\EhB�{��z4����H��OF���Ty���	��gu#JN�D�EuyZڑ�[A=�o�=}Ds���4k`���|��%Z ��u�JѬ�kAh���j����)�2+р�����W�U[���[s��h�8�ġ�n1	;�cF퍓w	�/����`��\�F��PT���~l �c�ϑ�F�� �,c+ґ����5S�PKs��nmh�.p9@����}�Z��w���p�ڈ�[O{��Vj��Y��ř��"&$D""""$�          �&���r�����V�-�Im�:�ƻo�oƻ���s���;��[��<q��q�<q�~�'�,�E�|�Ql��cmFR�����~	{J8�*��!cH��&�&�S�ā�_Td���I'`�K0�e����^���ʅP��3!h�Zo\KOt��*�b:���ьUf�-,�����������j�w�+"�r���9s�q�y����7KͅQ�Ea8��|�R� �	z�Ĝ�ś������u������\z׵�e���@vo?�Jr3-_qdM��t��	��	��m�"��!
X�=��=S�ڍݤh槣d�o*<�_ꄡ��ԍ);��q��kjF�,\!m���(��!ϯ�X�!����?���D�.�	Z5��h- ���zMUE<ӦEz0aw�����W�U[���[s��h�8�ġ�n1	;�cF퍓w	�/�=o<G*�7=������S�a �h��|�*4�X �!`8�2zdy�;��FT�T��3�Z���P+?c�qV��Ť�c���F���-sެՑ�����M��ˇ!!$�H         0 A1;�nz��f(�O5
�x�^x�v�z�^wۏu�my�~{�n�ߎw�m��8�v�{ߝ��Ul) �
UG�mS����q sp����)M偌���6S�m� :Fx1����ʶ6i&�׳���͞����$���Z�5�{j�$��P& I����=���x��\��"9� ����!��n���� ���Tx�hUR񽢫'"��c[)a4Q	��¬"E���R~.�ɲ��ܜ�D�oaZ����|m)�W�hԶVe��1������G��DtK���q`�sOQJ������}�y9�����T��Xϛ7�����n;<Y�]�(90�+�γ7%�(_M?�z�������O X3�OS�ʎyV��i*<���3��7���(E|�6�Ӳ����Ǵ(O�?}�b Ȥ\�6J*Ssj��wE���h���#4�6���G��-��<�K:�f�m;�T�	����}&�Q�
ý�/w�h9���4�t�.�@�u3֥͈�������7��������É��Q">l����ۧM����=�p�""$"$"$�I         a�&'}m�]���	�a\��+����q�[���q���<o�{mߛ���m����q����{��r
��% �J�� xm����q sp����)M偌���6S�m� :Fx1�����lY�56��m��l�؝E��$�Z�ٮc�V%<*�1 zL��<!����+�&0A��{� �b:��F�0�����Av�9�s�^5�Q�{EVN�E��BƶR�h�kb&�XD�1��]A�eW-�s" �����?}��Ҙ�|��KefX�s�9���(���{�tA��R�F�8�_9�����|�AD��>⼜�Hr�T�*D�,g͛���5�=���g5v(�����g:�H�T���P=�}4�5�K�hF���}��{�Q�*ױ� eG��]Fz�af�sЅ��5c��zv�i��Ǵ(O�?}�b Ȥ\�6J*Ssj��wE���h����ٶ�"<}�n�砒Y�[7�i��B��L��[�7��7���i"q�"�:ˤ�; �Lŵ�sb?뀽 ��7��{�-��5�j�,D|�!m���N�����!�w!!$�I       � 0��x��߮z=Y�JSQ(��g���z㎸玸�v���]��~y�^u�9�^��:���x�~4����q���LJ��ۉ�\Z��m�)�CKXd{�v���#,}��3J�!�L�K��֪=a�O�=�u��OI�g��aԹ��@�$��u��'���v�T+���˅P�E���5{�6���Z�Z"���q�	���; ��}��׍�h.����ŠmJ��Ɔ͹!.��Q�w���|��`}���kd��;v-0��b�b��2{��B�^O#�c������@��X4�E�n�b�(-4�����؉Qx{J�]�X�X�:�A�}���_W)�._RBr��
�Rք��6`YJ�3������+�Ha��Llt�0��)���@�<�J��ƽ~}�1-i�ɧ�D��sR��78�s5��'�R9j��\���׋Z�)��A���1̌B����#��e��}��*�}��i�G �m��a���Xl)��$� ���W�/��P����2�N�]�F��iT1 ֳ��:�e$fK
��]��������I$�       �b �<s�}o�=��%)��OW3�Iu�=q�\s�\q�;s��s����<�:����}s�s�}q�<u�	����A���}&%|x������-SӶ�ס��2=�D;�c{�>�j�H��t%�]kU��'Ş�:�sQ'��3�D��\�N�w�?�\��f��tr�e*�D��¨m"���՚�셛V�m|-a-yet͸����O�DƉ>��kƎִz��Sb�6�[�cCfܐ�E��;�|���>k	�0>��A�5�KG����Z�1D�Cؙ=�z�!uW�'���1��Fw���[�Jլm"���I��l�r{���lD���=�Z���,M,e�v	 ����/��օ��/�!9BS�
�)kBn��0,�H�}�e�k��0�n�6:m���[۔�a� ~�b%i��^�������d��"Zܹ�Q[�s9���j����qJ�}����ŭl�V����u��F!XA[z���D2�H�>�sJ>��ˣ�X6���fj,6�av�e������(MCI�M'o.��N�4��kY�|�L��N����e�"3"�f%I �      P 0 羼���x�ј��8��'��慻�x���޼�;���x�~xێwם�ߍz�~:߮6랻�G+Zʚe�,��_a��H�}p��Pb�qj�l+����QQd��Z�1H�_������j��,*(䙱��Y��ۼ	�׬$�A�b�����}�.�_�t�tĐh�4B33 �	c]������*WC,FB7��f%i�Sz���
hG�8YLַ0v��L_d��Ԇ'J��7��Y�w0�fw�w�CL�A�{`�4ysZ�i��Պą����� ɉ�-}��������Ⱦ��=�1�D�yMSTٴ�T�ްC�;�m�xd�\�C�4�9�i|�$`��Z��t4�LS�r��3�B0^��"��*��9J�r�V�B�]���7Ueej6= B'������!Q7�{�6-�����ћZ˓�l4��e#�����Qܫ
�6�sⴼIn`v��L�
�sI��P�y�`R��3����<=��r�BHJVj�6��
I�XX��еZP3�������#��ܷ��P`�Á`�A���)PF`%a�t�0�����$�I       ��@h `|�לs��s��z3tGyd�{<з|���<{לu�|��s�o�q�����Zo�[���s#��eM2��G���ᏤB��I��1p8�j��C��j�&DZ�1H�_������j��,*(䙱��Y��ۼ	�Z�M�52�;3yÈ��]
���� �0h&�"ffAtƺ#5�^�D�\-�޻	����M��0F�(!���e3Z���$F�E�"r�1:WT�ټ��ͣ���+3���g�{�٣˚��Ukj�H^/L���"��;��_�����΃��!$L��Ĵ�ٴ��@���b�q@-�/�� ��h~�5�"O���e5A�(��ܹ�&��������ʦn�NA�����:v������� !�A�x���k���ǽ��OwA�����l4��e#�����Qܫ
�6�sⴼIn`v��+\����X;D���'����pg����x{���
�����m-�P)!}ac/B�i@i����`�8�3rޟy@5�;�A)��T�����"33C�G$�I$�      ���1�{뎹�8�y㞻=Y�JC�<�z�ΪK�z���x�z�{�:�v�y�]�׮u�mB̺X'x}6v�t�<p6ђc|�4�}M
j���nh�MW�憵�L�!ϡU�VQ��x���|sh53,��R��Z�ە5֌M����۸�fp��dEj@1"��0�<�*��L-��4�/(�e����%��-�SZ�s�I�-!�~Uj@��X0��VEpS����MK����aU6�kpq)���D��v�em�M�-)PW�v���[}��;h8�T4�9Ŭ�2�3L,�М�s7:���"�p��/C�1l��H�7���^-��ֺ[\�H��n�pI��S �IHiOY\tM�%kP3XR-;C#A��z�b��JDf	�Sx��!Y|L�BnmE��h��)+��x��Nb���e���s�c���L�]Њ���r�[}��$j��׳`�9���*^3�d
�s��-�)u[���y�`4���2��VgcP͛�`v9�POȅs�a�����8Z��I�F�����Q(ȭ5��� ��Q�?���'�,_���˻�J�	�9��B�(�SSF`1!��t�8����A      ��Dm�|��s��q�|��=vz���yD�s�T���;����=�ǽ��;qλwΡf],�>�	�d��8h�1�Q�R���5]��74R�6�3D�>�W�YG�u�2G��͠�̳ʫ�K��j�nT�Z&�&۔���̈�H$]���E_�֩����e�L�\��#��s�I�-!�~Uj@��X0��VEpS����MK��U���H���j E�Ӵ3+m:m�iJ����<���hv9�H�ϛ`L�GL�8t'6�Ψo��ȫ�6x���[!}�5����D.mt��,�g2�J��+6�@	���Ҟ:��蛲J�0�f�k`�� �ڧ��)��F`��7�>2���Ȕ&��PZ��Mrs�1X��2���9�1����&S��E[��t9b�����5d��"�f���	xD�R-�+����h���n��W础Ҹ)U3�r��!���	���4�p��X��C8I#�hՐBcC�H�5��� ��Q�?���'�,_���˻�J�	�9��P��������334fdޙV � �      F�p P;�x�8�z�z�~9㞑Jb���N,�z��hS�9�x۞���랼�n7��]�aV��5Ɠ�����S̅� ��D�����-kG<m�����:P�YQ0�7�d`�����T�9QkS}�(�tZa����f;W��Ur�u^7��6� �-�r�v������z�r�B5��(^�X��+nZ�^�{����=c%fY/�k\�z�*<��mnisfƆ6��;��뽊@ k΄�6��)D�3���hZgLe�C�&B5�k��߷�v��m_�l&� &���{�2EM#bx��\xZ�a�*��j�~^�.%�w�j�R�S�C���c�*���Ea�����"��z���������#�5��u�����)��VgxT%9�Nt�B1s�K�"S�y|G�p��ۻ��i��/sFљ�zd�9�$��ɼ!��ohsb�"=��?�f�l[x��C]q��}���b�E��� ߡ�!��ܵX��r�C�t��;�>١X���=(� �e��5��	�m��P�m:�i�w�mZȋ��� �ff�̛�*�A@     �. 
y�w���\w�[��<s�)LQ�iŔOV5�
s�<w�s�=q�]sםm���K��*Ӗ&��tҵ>�*y��B�D����p~�A�%�h�-���<GJ+*&&�ь���]�:J�'*-jo�%�L6���\���j���[n���f� E��ZN�|=���V�^F���% +�K��m�Wk�osRǬ`$��%��k��C��X�Cg�XQͭ�.l����U�r�w�H `yЃ�[fݜe(�c&ww��L�	��#(v��F��t���sn�py-��T��D�@�]��zFH��lO�ˏP�=��P��^��e�D�����_�]o�w�t"�,cSeT1B�Ȭ5Z��]4�Xx��R����7�?��~�xF�V��pq�t�0����
��>�΂�hF.�u�Jt�/��n�pww��"�֥�h�31�L�Ç3��497�>���lAvdB粑������o �Pb�k�3ϳ�4�]�x`���>�1�b���u�Cֈz����sbG�4"��1=G���l����8����\m0�ͫYr<������CDTvgT�W              U����~x���x�~}�y㞸��-�4����:�<�����{��x�HS!��O�}���1���J�ؠ(��0Ĩ�RNrdY�{��a#�m,U��E\Ri[M�+�2p��t���E��{xu6�)�G��9�cg���.UUP��b��2�8�2ڑ3-�6���gƫD�8���Ó��"�#�$pj��\���s_u��=�q�EMړ�*��m�ڗr�+�(Gί�)��$�\Hkx��]���l�̔b�]�H�n�^z�*��X����[��`����~:�0줮2^�(UE�wX@���fh�,���7c��a���ψ�j�k�/p��1pLŔoQj-W6(�����nÞ/{&%��xAp�2�a�[�\���{�@*��-Ť�1m��oԨ�~ؠ�����]���m�F���.i[Y��Z�O^��Gx�����"Jn���CuN]���LQZ�ْ��G57�� �=~�f��O�c�a14S��햢۹TXKOvF�d|�L�U�ۊ`JT`����	�P'�D���L�/뱘
�8����Ω�T�              �o�]�������\�����\��=q�JZ1�ie��uZy�a�������b��C���92�5kXFt�������J���$�g&E�W�,�=���^�U�&���B��x��:a�z��e=�<:�N�أ�	f�1��J�*��?�ba�`���`O��jD̶��;���Q�{���g�ONz�̌�GX��K�X^�k�q��N8�ɻR}W�m��R�[%r������$�\Hkx��]���l�̔b�]�H�n�^z�*��X��508���Vc��݀������e%q���B�.c��_-�#3@��ϓu���`��s�6��v�n��*5E\1e�E�U͊,�3}�n�<^�LK�7V�"���d.%�Î��a���Uc�[�I�b��}J��ݮ�\E��~�i�J2敵��e����u��w����&�%7Q��!��.����&(�zl�LG#���fv��H3CS���u���O�N�V��Z�n�Qa-=�q��u3�W�7n)�)Q���?����x��B�v������3CDvff1��g            �L0�9�����9۝�玹�9��㞓���<�J'�����j#%U�4�E��E�3bY�3B�٢2N|��v�[P�-	SnFB1�h=�P��d�2��+���&dʣش|I,�iYk��9��%�U[	�a���Ő��#�hڵFu��1k�~��8T��!��`L<��7~"Iƈ&�KBe���\��D����U�cBV�hD�ڃi���CEe���*��F-�bl�-�����>����\@�J�Vτ}�r��5���9l�I	y��X�B4q��v~�����{jF��#���}��m���6
���/�m�X���j7'}���4�2�2'�xninO/l\Wj����.qz��2b�a�B��s_o�NB��ZTke�Ws]�T�d�O������e�:�1:�y
=:�/\������V�Fq���H��>�6���T���s-�d׆�������3���ⷢrܭc���Q�!��J'��b!v�.���x(����sh3a�Ҭ�&NK}�İ7X�Rnxq��7��_�� 
N���n�Q`�!�#�31�K8           ��`!�\����=o�\y����<u�=q�\o�����Q<V�'��Q*����/��/uM�����ֻ4FIϟ����+j�*m��F:m��}���S%p�x�̝�Z>��_4��]�Bભ��0��|b�`K͉�mZ�:�Gb״�gp�HC!��y/�n�D��M����kb�%��(���˘^گc�;B ��`h��L����+-��P�*1m�f!h�����<ٝk��Z
����.S������"m��!!�6+(DX�p;?T����=�#z��{�>�t�6�tX�D��S�{��6�汭���nN��a�i(e6dO2����.�^ظ,� �7��p\����P�����˚�}�r��Ҡ�XC-ڻ��%�~�5����A��'C2�!G�Xe��s�=\j�(�7��)u�ަ��j�=[jv�2k�F����rm��~��[�9nV���V(�Z�����1�M�i���P/5���f�23ӥYRL�.�0����`n�h����=)������� Ru�Π{w������333ffUU��V           s8 |�ߝ��~9�9��߾y�z�|�9�w�%�)�4�y��jN�aR%��vÈz.&�YU^
F�݄-��� ��ӓ�:�$���b�3�Fؠ�j$���Q���,���o�b�쌶ճGM���X�IFgh�E��E�=c�V�(���XW�>+%�	����T
�xL�D��"4:�7�������L"�g��A�]:��S>���;v���c)m��q��^1o�@1�e�iY�&{��U�L�b�s�ww���b�$�-)w*�xw1�k�O0ڬ��V�}�e�J*�N��;��G7�^=1r�VE	S%d��X���dc�9�u��oxXF�i�U򃹶D�C�����ʹ<cs��������<��Af~)39uƃpjM�%���As����j$��-�b��4HC��l�1�s:��Ww{�被g-��WM�Bڊ���`����l��. �2"gi�r�|;9�C��\Ic��j�̵d���Q:t�����{���9O��U��&�l򡩻�ʤ�.|��"t���������#�ҽ��;9�`=J����3*����R0          ���xm����[��\q�o����\s�=s�q�s�	-)HD�����Rp�
���(��M�G;���UW���waz���=����W�$���b�3�Fؠ�j$Ψ"�w	e�wT#~��de���:[�Q��(����{ȹ��V�(���XW�>+%�	����T	c��2�����4�>St�bw�i�V���[H9��S�jg�н�XJ�1����8��{��ǐg�ɗm�fT��^�W��2�Q��l{޼�.�Nrҗr��s�l��mVxi+E����ԇ�F�cm��=Ύoj�zb�P���J���	^�F9��gQx�񷅄h֙|��m�; ��t}��3m��#[*5��ch�y�����Rfr��P�o-7"�e���I5qKAr����s[%�{Ρ�Ul{�被g-��WM�Bڊ�6g[�7�Sd���p<��;O˗���>(r8��,v��^�Y���zwQ:t�����{���9O��b�XvԚ-�ʆ��F�*�D��}�N�أu��� �w�${�W���l����� �#3DfffUA��T          �� �玸�7�:�:㎹�:�9߮:�x��ߎy߄Ԙ�#@҉���'t2�R����,��7jܪ�Nȍ^~����<n���}n�X�+��@2�JH�*�'eKtUJ��S����5щ��a����z�1;eV���u5:�kZ���l_�7�^���1p�Z���#���ͯ��wlX�T��;9/��-�Qs�Z��j��0��y,�u��O��xҙPYF��E����"�8ьG2�LP�CC�`de��[�);�w&9�ӳ�Y��S(�֋���-�q����)�Yl�RQ �ws��gZ5��2�c�_F)r������n��� �I&��ҫ�Mvyit�:�$#�(���JFd���'�B�������z_t`t@�c�k-ԱD� �V� �a�`���5	�K�Xx|�4�O���,k�w�� ��,�F�b�]�����B-e��K-u��l�Gn�|T�ww[U;?$1N\ixGK�'fO����d�7�+b�����;�e;���Yl�K+�Oe�6+s�dE���^s�"Q'�� �`<4�\J�eј�8Ff���̪B#70�         �(��q�<o�<u�|u�s�<u�<s�\u�>��;���	�1HF���m�JN�d�{O�HY�^�4nչUh�����Zx/��ب��f��r�d)D����vT�ET�i�9�6k���0�DLt�[����Q�麚�f5�RF��/�\�}����3hmj�����'6�]ݱb�R��侠/D��E�Mk�:%�n���%��N�W���ӯS*#(޵h�ҷ־�DSG1���TI�0�CC�`de��[�);�w&9�ӳ�Y��S(�֋���-�q��f6�N��g��� u󻜐��:Ѭ%Q�0+*�1K�'����K���H9�I��>4���]�Z],����J,e8R�� ��	�P�� /c���������;����[�b�28��A����F%jjd�E���SA�d��Ў2ƾwz�,rLrʹj�.U�

1�/�"�]%���öP��z��*i;�������.4�#���'�MM�e�z+���{�����i���e�,�m=�8ح�]�R:�Z�y�4�:�����@, �����^l�����}�233UUeVU1���           @=��z����߮:���{�x�~z�9�o6���~��^��E�(��4ҹ��iQ��ʐ���<�H���8Ķ,j(�2�%ŭ��ۍT3����6H�ꚻ�,�Z�j`��5�S��4���F,4r�Xt��.����Ց:��u��*ҢS�45:�>sJ�.T8��kGjS�=�".y�z�L���c�EM����v�x���WQn^5�f�+�{Ck�@N_��4��;���v�P��qQ&Q��<��'*�ؽe��6I�;����E�������
����gL�����/���`P�bwgxnv�3;<G*��L�+�g�W���M7i���톙�����b���pG0�ine8�|�g
M�D#�_�aw���� �j�ږl��������:�t"W��@K�Ϋ �Z�Or��R�S����ȍ�`�3lX�vV�XK�U�z�
0�is��bgS��xw`X�L���5���̣,ށ5��{�ҰՋ5 ��A������5��q���t�iI�Hy�~��7l��X�ݴXN���� �#vLG{` �ᑙ���*����ր           "�xo�\s�\�����q�=w�s�s�;����y�\��;��:��J-)Gġ��ͬsJ�ȴ�T�E,A�zD��%�cQF��	/e��[q��t0UT&�=SWb܅��PmL2<Ʋ�juTf�C�Ph9i�:tbQT�njȝX̺҉ڕiQ)��R9�N�*NT֎ԧ�{�LD\�T�)p�]7�$ǎ��5]"��%���ܼj[6�^C��_�r���0�)��Y؄H�h��z���2��a�ٺD�_[��֦�<wws�H�6�9B���с@s��|,钳�Q\��E�Q�(v����7;w���#�l�m�v�}3Ϋ�F^v'.��%�1�3���75�	0��a0���q|��`&�4��!�����]�@{T.Գgf&geX�FFi�{��d(�^���`�_��P�
S�www�y�S�m�.�
�+	s����W�E4��ʱ3���<;�,X�^]�҆�bfQ�o@���=��X�j�����OyH&^k*�]�vғҐ�,�%�n�ob�˺R�p/��� ���b;�����33DffeET!�i�        T@�$0��7�~��~y۽����ι㮸瞺瞸랻�y�9߾z�f)�4�w���JXX�[Q�'��&::�Z����\z˪h���u5����˟�j� At��kh�Woi���49����!d��0,�*SaA��R��TQ���AUY��4���C
6�k�îN�[e����A�1H��q�It��棔��"��թj8���g,5��<�ZLF2k���A.قI��n�T�\��N�Xri��u6VR�i^h-�k\ڙ.+c���Wl��iLSx�1���G�����ϬA����M���-�s���@��9��-�����|f��,&2��kc��4di
�F
z�f��WC͓h����`�C�Mr��'la	B|?N[��Z^���_4e�^p�[Gjv�o���+�aj Q1"XQ�+Kc��F�P�NV`4�1JFR�q'D)��+
24�<��I��9.��̺N�fij�:�S� �/�-�*�o��T@�,�{���p� n:ksN����=��9lz��7�[6���"���#i	��{߂[�e
�f�2��332�������        * Hxs���\o�<���s��m�\��\s�]s�\u�]��<����=r���h�Q;��U%,,Q�����F�{��@�=e�4zbk:��� ���ϋڵf� �Q�5�L+�����|���b�HŘu���� �J)A�*(��� ����]���s��@��\a�	'H-��H�[ 嘤OO8�$�MIsQ�ch�@`jԵM�ty3��E�T-&#5�AD �l�$��S*^.o~'y�94ٌx:�+)x4�4�5�mL����{�+�J´�)�E�N[#�ja��e�� ���f&����ǹ�|� N��i���\ty>3p�	���j��5��k�24�G#=C��I���ɴn{zҰq��&��rv�0�����-�D� �/PYm��?�ï8J-��;E���~�0��5�(��,(����|�C(b'+0����)b�����e�r�rt���r�W��]'O34�B�s)ʐ[���c7��� d��G=�{�8d�75��AQ���{�=qvܭ�z�Nxf�q�������-��2�B;������"34VfeU33"'m�        EC<��~:ߎx�~;۞��nv���:߭��{�x瞹���8�~w��X���T���:�B E���e���d���)'���I8ri9��.,7Z��Z�m�h*�Jp���oe�WK@$���f "�EH�I�4�P��[{�B�~h�ynD�w�T�����i;�7K��4a$��UGк��+n�"��9���iF��s(�Db�բ�i0,kb��E%����I(���]I�v)���\����&$&"r5�k�B�Iӧ�({m����)p��	b�	����Y�p�4�I��l1��\��m��Q���9�Q�����r�[*���zV�ܵ�+kᴠu�m�$a�ۼ�4���'p�КxGL~�\�Hu/�/s���#��f�z$PV%��ł��p��7h=@�59�Q#��zEۈI*�m���ʴ����-����
B^m�j��K�5��@��6�r�$�u��r�)�4�wig��6�����MN���S����8Sm�#F��D���vh��|"��v��R�a${Nz����<qv�j����FF��̪�fDB$��`        h�b!��|��[��o�{s���������[��\u�|����<��\s����x��|*�y<��T�@�;we���d���)'���I8rJ��L���jw�k%�E��9)�H_�쳪�h��ZL�VBȩN�Dv�(Dz����f�q�3��i��R�\�#˝���,�lSFI��q%T}�����f�R\��\��]�9�[�1M��|�`X�Œ=��K-q(�Q%�ԛ7`���I���Y
�bBb'#�Z���t�����m��m����Z;d�Z1��ܳ���i���} a����g лm�ҍ=ӆiT~��x�q�k\�AVʳ�0���ܵ�+kᴠu�m�$a��s����&��8����:c�0����E�s�քq܀���D�
%��ł��p��7h=@�59���$ u�gn!$�m��j��mV�ֺ"�����HA�ͰM[�%���k��mi�D�T���ʴ�#`�%ݥ���ڨ":*�%P�ke>{�s�6�r4jq���u|�4P�>
��QѻBԩm0�����8=�{�x��.������}""3UUUTCD!$���       C  0 �����z�{�z뎺�x���߮w�v�z�x�vﭸ�~9���9�;��9y�FE+{椚���FW7Rn\��Y�ha�,p�h#�3@�I!*,,��RГP:$��V�Ĕ�.��A�p4��#j�5��� V׺����\rWv�W�7�Fgf���"6���e8ZciZ��5�-�rA[�&�3g.EmM1-y\��hnԦ�SZ�J/d����b9� �$������ە%�B%*�͹����ؖ�C0A)?�{���* �Il��3�[Ծ���N<%(���%X�f�@VCd4�g9�'wwu���qT�U2�*h�<j�hcm!�h%��`�I�R��s���5H�s7,dc�<�y�&�\2��mw-(����s��	.q�H���ya�����'�mǕ� �Z�U�n}8�����;����u�P�"CY<��BZ�#+G�I�Y�!�H�u��[��#�vwwif��f�~S!yf�:���h�c]$�C�C�E�{���p�0�*u��nn�������)�J`���mlũ2i���/Ӝ�f ���������N�Z       !�   �ps�}s�=q�=��=u�]w�<s�|o�;��;q�=q�<u�;w��u���}u���������#"����sRM[Rr#�I�s�K��8g]���`#�ԻA9� GzI	Qae�
����:uU�q%"˱s�cp	{	R�T�Fa +k�J��®9+ne^��]�U�毬\��%X���)��cJ�D=�fil��
�0�L�ˑp��SLK^W:U�47jSb)�s��Y�z�ˀYE�v�gÃnTh����,�m��MĴB�	I������Q�KF���V�/��0��	J
�I�i�C�+!�^��������ḣ)T� ����!������n#A,8�KN��;�g�i�D󙸉Ąh�<bɻ��dX�6���xe��9�{��8�
��V��&[���0�hw��Si ��J�­#s�����	����ꆈ��A,�������	$�,�äL:��-���;;���ab���L�� �:M�]��&"B��.���;�wY��S���e��ųE�1��
oR�)��6�bԙ	��{�������|�����""3TUUT33!$�v٠      4� p;�z�9�z玹�:�~�߮9�9����{羻���7��玺ߝ��njR��S�4�kc����!�s�D�eA��iݙY�ȒT�*����nB�*h��X����C���Z�Ui�����܈�6����h�ޒ��:g��VGb�����m�& �N��[u)�]�>L�\Ȟ����b���(�i�D�b��Ya��r���t��aH9�E\��(>q��i����f!�m4sWjJ��[ɉPm� ܍t�����6�媏;)(9g�3Ֆ����녦�`֍�TރN��*iim�nGQRK��%�IXb U�"��̐�.���7=�c)���ζ��*lFƁR�mr�[a�_aV�<��"$I[Dmk�v>{�N�dO	�Y�ٕ�|v`]�R�&��wX n�J��Q��1��v��s�Q]ZW�R���鶁�k��qHӂ��$4:{���{n%Jj��W�1�GR7UY%�k�e�E�����{���w��8�z��לu*�@�>�͞P�,���62�ץ�5�׽�{貦zJ�|��DFj����fD"$�N�4      �� !�a�|��]�םs�<u�\��<s�\o�[��<u�<y���|��|q�s��q�<��[�����JQ�q���lsB�<CbS�8nph���3\-;�+19J��V�i�Ʒ!v�4cs�D�cy��K�-\����vn���DEq�+\ѵ�%�-�
t�K����SQ%:�"L$8A�<�%j��Κ�h��bf���D�.��d	G;L�%�L����`��lwN�>"I>諙"V%�131��#�M��Nj�IR��x\�6� nF�eV��Xm��G�������Sύ�{u����R���5�T���|܎���,K����@��E)�-�!�a�t ���cH�Ľ6u��	Sb64
��k�B���
�����I+h��u��x)ݬ��8�0�2���¬���WdԘN��\�PuX�����^�;m�ƨ�� ����Q�L��@˵�H��s�5�Hht$�ec,��J���+Ưpc ��n��K��3|˦(���]������q�k��f��U:�nl�ʆ�f���q������Z���}T�@)\�����"2D4DD2#!$�I�m@     DEB    �;�y�7�:羹�z�:�w��;�y�~{瞸߾xߎzߞz�~7�}��n7۝�5��FD�4��W���	��ɳt4)����_k	4�Kq�\���y��e�T���+�9��$Qf�Q{�Ӱ426�+z��Ha$(�޴s�J�-�11��:ͺN4�+���*Ih�x�Em��I�HBy͠�[�ph��k��h$
�:N�k����cR�A�tc1�� ���G�`�cJ.���/4W���DyV;�5�d�����׹�+���p�LL�an�R��7H"��1��rI�[a7+v�ikw�k������h��j���77P43�Ȃ�-fJ��6($��0냊E���*t�E#&Jֵ+Q�!\�u�-ӓtB0|�a��<��\z#s�R�v�jv���QH�l��SDI%�,N%�'1rA��{�����P0��V�n1
l7��q
�rR���r�1���7�-�Z�=����eVXč��cIf0���ݑM�
͵ݗ=�{�U��l��ơD�zi5�(���D��]�եg��hF6�����<��k�9�$Dd�h�hDF"BI$��ڀ     ���   A�\w�\��~o�>u�=y�}s�<��u�|�ߜw�\�����=q�|���<���o��u��o�;jk3���i]Z�%q�f�hSA��$�T��ͱ�KW�,F_�H�Nb�c�i"A5n���;C!sPbA�vP�{$0�JoZ9ޥ����ff�'D�����i$����	'9!	�6��nt��L.q��*�� 8W8��Ռj\�5�`�;X��s�Cl,iE�<E��4���yV;�5�d�����׹�+���p�LL�an�R��n#Fy�|s�Mr�	�[�cK[��\��0-�4�@�wTT֓q%��� ��Y�ҷ5��	20L:��m<���<�Hɒ��է�B���L[�&<�`�=��{�yMȸ�F�L����
���E, ��,4D�Z���\�s$����ت8e�Ui����q��K9)|��9l�I���-t��ff��,bF�����kU��wvE4[+6�v\����W⭳cK�����x��Ps*T����������{������V�-a\���	G""TD53""""d�I'm�     @�A  3��:��㞹�x߾�玻㞹ߞ8���:�:�~9�9۝��];�m��}�׍����{ۮ:9��:�4»���T���vc�I(���)�҆��"�oMl�f���N�� 0'"78MɴU`���N�r,�C8�}��hi6�(�S��ed ZU����ij"�'��:�W=ꂵ(7��EW,"���B��niK���YQ�Rm���7�i���+�4�h���ʟ�I�&�	�%�e]h|̀��6/_����1�熤Z��Ϛ���CL)�-�jҠ��&Z$���[%"Fڕ-+c�ol�ւ�|�běmǫ�����*P�/d'�q{w��Ď��>-ls�����u���>R�B}"���ȸ��kZȆs���@���Z �qHtX�T�d���'����2'RZ%@�z�Ib����Kd�%L[B" Ѳ�j��9F�������.���������Ae�ٙ�b'd���3Efm�7�Ql�����%������p#[P͖�C<#���*�M�!�B<�Q7�,�3^���]�3�RF`2���!��$�I;l�     ��� �u�q�w���\�����<u������<��=q�<q��������z���o�;�μo�<o�<s��q��LQЦy��lwB�0em[��H�E%�2�P���]�魔�ۺ���ܞsd�F�	�6�����9T��A��Ob44�Gj)�J2� -*���w4�&&OӦu�{�jPoc��XE����a��Җ�%/���z�m��#L�Y\Y�FȵNT��H&�6hM�(5@+*���]f��b��cSX�&:<�ԋ_2��[X�hi�6���ZTJ�-cwr-��#mJ����귶QkAz>k1bM��Ն_J�Ahš^�O���85�|Z�>�h7'�%��&�-�|�����]�>E��cZ�D0{�����6��(��C���{%Y��<����߿FD�KD��P�,\�6�5�l���hDD6W�ݜ�RK�W�CYJb�Jc�[�GV����l��1�V�T�����o��-5w��K'��{� 7��F���-��x4GI$<�n!Z�:����)ga����z��������""C3""2""!$�I$���    @0�� ` 0�6ߎ��7箸��﮻�:�z�x�z�n6�m��nu��랸�9�~9����z�v뾺�μ��())Q@҉��z�&���6�qIy�t_*J��7�亊*�{��V�Bf,��U�:�p̗u��<�	O(l�J��R�b@��pĢV��*֪�3p���I5P��d@��!�h�D�����J���c����"�i0�֔g'2-C�ӊ�����lB�^�6���,o�A$�)BÊ���"�F?K�����9��p�@"K�`N�h�>h�& ��$m*�|Anm�"M�dr�Y+��)�cܶkc�J�i���q�mkQu�ٞk��)���ԭ���(��U��W�i�Ql���K�E;d��kW{�,M�F1���=�u���V�2Yk��*$��ev~�{Wt4e��M�e�i)Y���W(���>ki�#���--R�:��B����^
q�=�quCfkc�5"� �Y��*�{�!��>����`�9 �k1{���j�9bM��(���b��#w�&$�`�fmN���x6�崶q��($BD�fDDdDDBI$�I;m    �`�� � a�m�q�<o�]q���]w�\u�\��<�����m��k����;��=q�\s��sϛ��<��\��}uǝyɬPRR������RM��\�n)/1���IV��|�QE\�/u�J÷�LŜ����GZ�-�.6�-0yh�P�p��b�Bā!�D��U�U�*f���!��
�#L�;C�5�(�s�	V1q�u����BC�a��(�NdZ�a�5��A�؄#�8�lmgX�P�IlXqV\�Qh��aw�=`��\�2X�(It�����B�LA-�H�U.����D�>��t�Vc�S�
ǹl(��ȕT��.;M�j!�#�3�|���e70t��q|eSj��J�M8
�i ��v�S�*֮�
X�6�cT;e�{��3)����d��u�D�4l���oj�щ�̳m%+<�}�����m7#67#L$Z4Z�2u�	~���5"��	l{�������jE6s%\�u�2'�7}�,�P�$�f/t �^íVG,I�rP5��%@� F8�LIt���ڝ�{��m��il�����-!#UUC"$�I$�v�   �p� �@ z箸�x�9���~��^u�}��Nwۍ��~z�9���8��ߎw㞸ߞ�㞺�z�~y�x랹ߍ���h(�D��'���B�]'{o(��wS�m��}v�e����T
�#�G �=���Bؤq�$�pثs��ulg
�L	Jc�Z�5��m�av+*}�{X:14�Ơ%�Ua�C���{[MMc	�*�1��Vż�p
&�9��Զ�����s-VU(�\��ZL�R]��a���>i5wG��r-[.sXӱ�-��Vhtqe-��`�h�2��6�qKPn�+��s	��	�w*aT!j5�*���|���)LnuTef!�����F�SWm�t"粯�^��0�Sc�s#��Nsy,n�"Z9�i��Y9^����қ���uFxV׃�q���kf�'�qy4.
N�����u�T#�sk�H����kcIjF�F��m��2�k�� �c�7:�/����kG+��eٚVZ�5�
�.��cB�m`�=�|9���UM�%D	�0[�#�2!)J6SA$0��cZ�Y�{�����f .����������I$�I;l�   n�8b `  =s�\u�<sל���s�Z�:���m�;���m�=q���|��s�|��;��\o�}q�]q�=s�<��<u�\����j�tH"ie�lqB�f.����Sc��h(�s����9Mi���G�R{#,��H��I�\���c8VZ`hJS��Y�n�n��YS�k��щ�65.��9(q]�kbI��a1Y�#U6"�ط��C���1�z��:Ջ�C�˹����B.pM-&F��.��0�EYN�4����i0�Z:�\汧c2[1������[c��|��eem���w5i]���M�pN��S
�Q��V��k�mMJcs��+�D"A�=�Hܔ�j��6�\�U��5�Jlp�Ndv'9��7C��
�ִ�Sl���{���Z�MЅ�I|:��<+!�u����`O<��h\�Q���ΨG�T��&�+!����KR6�5�Sl7�s_��#��0�}>nH�;Z9X�vr��B
�T�aSe�v�,h\����8�=������=&s����)��j�B1�s����|_zP����a�!"TB"$�I$�I�f@   0� A�@��p㞻㞼ۯ7�m��}8�n��~x�~z���~y㞸�{���;�x�}���瞹�y�9�w���z랹5zJJD(��W��i�l��9���W��:�1kdu\"K�g��j�d[lTɊC,pm�f%���@��Id�WSW���9��d���7dF�CR95����/T@9�i��Wf/b���V�����qr�誒�u���c[�׊���(�3k9!L�|r��A����jE�hB��X|�6f#�1�������W�߷Q���	�����������:lsm%���v���]���m��u�R)�e��2�����T�ܳ'+Z�Q�6�d��s�.�������J.�}�w�\�����Q�[��+A3�{�W)���#[D�d%b�k�5vjg٭�l�=�Då�vS0�P��h�k�mr�BK@�er#ea9�˙&�,L���V���CN���F����܉Yؗ�_F�X��"�m"a���A˟9�Y���ۨM��.����Mf��5Q����5�m���S�����_��Pq��h"BD�dD$""""I$�I$��̀   a� ���  ��=w�=y�^o�����q��m�������=�����=q�|��=��<w������[��=s���<s�����=w���=rj����Q=ޯ5$��L�r4)��憳]^�t�HŬm�t1�p`t�/�K�U�m�S&)����h�1,��K&������]o�������$���"7�5#�^��Dӝ��lvb�)M�ejM��.n-#�.��kr��^�p��mg$)��Q;24��mH���V5����@�i�<?0jj��lE7��dCm��i��壥)IOY�69����w�
;]M�P��Z፶�F:�)�2�J2�����T�ܳ'+Z�Q�6�d��s�.�������J.ٻj�2�F?qZ���sNV�g �B�S}�F����J����`�٩�Of�9����[�M�L��C�m�<q�i�ʵ*++�+	̆\�5�bd�M����:tt��54�n��J�k|��jE�\�*��&�����s�śk:����NJ����(i���ƪ5כ[f��X���s����+�w����τ"B""!$�I$�I'm�  W�@2  ��]��m�ۮy���x��ߝ�㾹�κ�{�x�{�<�y�x����랸�~���瞹ߞ��6������*(��@��+�W�T�eeL�,T���Ք�e4�ZBV�������ع�##x�X"��zU"�Ě�dmRR�6Z6�������Db\Z)$�|3�A�NTUeYQt4�%�ɘ�9fl�.b�I�������/���!��Y�c5�&Z�B�]��d��+��E�c
ף�K�舘���T"U;qe16kNЪ~<+�:j�օ�+i�ʕgH<�b1��V��%��hMwk��5Q{!��˚�$SF�OGqW{ֺ$m�J�K�	��*aF�d���c[��M����h!��Hж�+Z�	Lz�[k$#g��{�4�v�":�x�z�$��9�l��S��0#ڔ8�"�/�h��������k�wk� O	2JT�)�y%&�]�Q	�Y�,��Y�#�KhMr�v����v��ZƘ�K��=�g�X,�
�m��J
Κ�e�N���]�T˾�{���;�D�f�	������I$�I$��Ā +� ��
� �o��q����<�����<s�|���q�\��]w�=��<w�=��sǼ��<u�}w��u�\s�|q�}s�\��\��s�}u���j�|G�id�ͫ�B�N2�D��0<�R�C�KVSE���i	Z����sb洌��`1qU�@j�Vx�U���J[&�KF����a>��A��E!���|3�A�NTUeYQt4�%�ɘ�9fl�.b�I�������ήnq������2֪��8�$��\%�,cV��^�"&0���U�N�D�BM�Ӵ*���
�N��5�eJ�ms�ΐy.�cWp�-�Kc�К�׵�j��:C���5�H�"�[4wqW�k�F۴�t�ܐ�m��k��A�Ͷ5�H4�jm"4͇~�h[e�R��=v�������=�S��;X���-�=�p��Z��7=��5N\��ojP�� �5�:�nd";Mq���r��	�&B�A��R�>�$����*!5�5E�U���#�KhMr�v����v��ZƘ�K��=�g�X,�
�m�G�PVt�+,w67"���ʠ�]�S����ߚ ����>�"31$�I$�I$��P B  �6@0�;�}�^x߽��z�Nu�9�8�xﾹ�y�~:���9�z랷�������~9۞�玷�z�~w�xߞ:瞹㳕���<�K+�V��cm%�4܌褵��f��![��T\�@�2��aT�f��1�5kJ�1�(�G%2
�`̑��T�:�[��{�D����!Y4Z�#k����V�P�u��6H����mU&g��RB��ڳT,��l�_T܌=��8�j���)�f�2
Ρjs���M7!���1�cb�ĥ+lt���Z@�<y�O�ܳT��E�J7)� �D�i��̋X3P�i
��������$��,�c*#`�)�*�ִ�h`��d������]�9�@�l��C)5��P���du���j�iY�3���wl0(����Eb��b�k�6��U6����2*���]¥�Z9��)�Ɉ��i�͵�9��@VčU�Ѩ�Sbf9m��ƶXM��I$홳�5�h�汵�ǵ��\��ك�<�5����Ӡ�m��ZETgm��i�3���i�e6�c^������`9� �����������$�I$�I$�j� �  @��|��<k�:�����<k��s�=q�\q�=s�}��}s�[����]��s�\����w�w�[�����<u�]��;�s����<������Y]Z�U�[`M���gE%���7e'��݌���"�����
��s46Q��ZU�qGM�9)�U[d�m���t��%s�%Lͥ"u�թ\]f�������)��ZF��hDN�j�38]��L�՚�f�e����a�F���T5��Hd+7��VuP���i���v1��6%)[c��TZ�Q��"}���mr.8�Q�NA�$KOe6ndZ����H�U�D��5� h�f�Q�N1T浤�C ��[ ̵�l^�F2�1�jЭ52I�8���T##�ƈ�#T�J�)��s�a�D&�%*+�Kv�Xƹ�ک�meY�P�l�z�.���֩S&LDM�m�x̈́��$j��E��1�l �$�^5��4$RI'l͜�)�[G�5����=�"����A��l�̝�m�
�*�;m5�Mi���O�)�;���x��(����t�23"$�I$�I$�m� 1�    @p���y߮x�{�9�z�nw�n5ߎ�׽��n{׮x�x�~z׎��m�ߞ��~:�~5��9�9���;�:뎺㞸�y���w�<5:�>3�4�x�m�Q6klƞn�D��rU5�I,!�anʵ%*��.��h�T�K�����!L"ƨY�L�Z�I��$ p�H�"���3	��S�7�B�Xe
a��Z�Q	f�hm֒�R����	D.�Wk�V�%Ԧ٭�ڝ����:!d�H��Sl�5���R�So�1�SBG9�j��G.mZ�Y� ����Z�,�g��d�Z����U��Xj���Z��i)�]�Okrw.�m��ڈ<c��5΄!���T�9-\��g�wS��1�[f;"X�=��T�d��\ؑP��5���{����\�g+�K�jD��7#�F%^5��J��-�Q3�M ��9�&[�B4O���#���S��$\�f겘�h-�bY�akY��,k�[�mCf�:�a����UQ�kr8�,k0�gw|F�f0�#G`��.���L��"Gf$���ͩb������fu�����	���I$�I$�I6Ҁ�     8r��\��<��<u�=���ƽq�;���[���q�=��<s�<s�=k�[��o�{s�m�������|����u�]q�\s�<���w�;���eǚY<^��(�5�cO�H�\��*��$����eZ���Y �W}4
M�P���F�A�cT,֦B-l�̍�Z 8s�$FX�k����	s_��ߡY�2�
��u�G(��C46�kI|�V_SM��`��ʫa��Sl���mN���͝�P�ZG��Q�_©V)�ژ�)�#��5M�#�6�S,��i�L��V�m3��W�Y]Mr���,5B�٭k�K4��.ͧ��;�P6�ҌmD	1���B͉V�*k��V�3�;��kЭ��,V�d�m�KQ�lH�EĚ��au�������C3��%޵"Lӛ��#���
d%KY���Ԧ�o�֓-͡�'���Ά�����m�uYLc4䌱,�0���[5�-�j���_D���Mg*��5�G�5�d3��#D�@���0}B�X�Eց�v�#�	FK�fԱd����݊�����$"!!$�I$�I$�I�P�G  C� 瞹�:��瞻�����띺�w�6�n��}:�n��~u߾6�x�z�y�{��㞻����瞻�9㾹玹랹랸띸�9��&)�4�
'�W��hd$7��=Q��t�j�V�\��δGH�e�d�O����f�C������6kD�;�)̬t�f7��&�8�K���}���T3fE�S�V�#r��nj���īY%�A�j'�ÒށEW!���1�I@7M�<�E@6��
t#��i7��l6��f�#�H�Mc�6 Z�š�Z���t��7'bĜ�}W�k�q�N��Cl��S�Cѭ"r�����5���J��]Y�#*�����V��%V\h���M��_4�,v��.S*�J�೜�wϟ��A�֮M��Bn2�Mm�;$�R��aVR֕�kt�5�f[�����s�����DcQ�DNjڇ��B����ZءМ*k��o���!@ٱ�u�{Aʰ�J1� ����j�Z	c(�6�#a���L�֩��iܹԳ��K|�#f e�����	���I$�I$�I$�(@#��!�` s�\��s�|s�]���s�|u��s�;��q�zﾝo�\k�:��qּs�=s�<��=��}q�]��}u��s�]����\��\��\��\u��s��j��G�y�ի�Zm�2���=Q��#h�YX>�rN[:�#�U�]?|f� =���ϟ��v�cah��sE9����������r�C�Cw>�T3fE�S�V�#r��nj���īY%�A�6OA�%����ُJJ�mQ�b*�����pS�e/�{�*��j����2��X�(����h| ֮-m�$�\3�bN^��Z���������%����ZD�Ն/D�X0ׇ8mjԪ��Ր�P22�
;��a�l�UeƊ��q	���枖;[K)�T�N�Y�f��;����l ��W&��Bn2�5���5J�i�YKZT5�Ӿh֑�l7/�E[��t�j0���[P�C�H[>|�K[:��M�5����@ٱ�u�{Aʰ�J1� ����j�Z	cEhmvF�q5�d�L�sH��Υ��J[�ȑ�����e!$�I$�I$�IZ� ��40 0 ��zێw�~�ێ7�n�ۮ�����߮��x�9�9�u�͸۝�ۭ��nz۞�랺�9���x�{���~{�}�뾹�:���������)�8����4��Jl�f�]�A
�8�cI��3jV�61ST�QDs�hJ��tV�1!�Ӝ�1�MJ�٭��%�ά�X�3!6*t�"��:i[X��YE@1kd ��9Z�5�3qg6wk_>(P�H���9B.K�Lc r!j\ԱVKX������Os���PF޳��M��@�ʄ�v�p�h�Y�u!�H�K�Z�:�vfԥ�pV��$gNc�#e�իZ�E6"E�в�l��m����t*��e��+P_=\�� k�]�ɹ�%�u��$JS[baP!�����Qӑ�6)#8j���q���V��p[f�r�=%� �F{��k����B4(�xD�4�kU �(ֶ�9g`ۆ��Fȃ3ZƵdk�=-cn6����.�6-Q�>5��Y�fȭ�����gJ�Vܕ�<˘]t�S�.x�[��`Ca��8""$B"""""""I$�I$�I$��J �h` `A�������u�o��q�]��=��=w�]�]q�\��s�\s�\�ߛq�;o�[k����=o�=u�<s�[��|����=��������}s�\u���=��;�ɩ�R�q��sJi�2����l�N��qJƓ-lfԭJlb��΢��hЕ+F�6��bC��9�cښ��Z5�K	�Y��fBl(T�EultҶ��;����b��&Anr��klf��l�־|P��v�%�=u�6r�\�1�8��@�BԹ�b���ic��41D$d��-l�6��g5��(�͕	����7��Z�Z�CN��d�*�$u��ͩK��@3H2ΜǶF�׫V���lD��%�eT�2;�kY]��
U� ��-�V��z�sZ82@�4�͓sJJ)�R"�)�H���� C��s�У�"+TlRFp�[;��nU2�����l�zK�A���sZױ�J9�2�hQ���i�֪42P1�m�r��<7�����
f��j��2zZ��m��+!]�8lZ�>|kH�͑[%	��Ε���+\y�0�����\������������!$�I$�I$�IU� �� @-O@0>:�:׎��9ۏ7�|랹۞����~;㎹��������z�9���:ۮw�6׮6�^xۮ��8�w�x�:���������~�磓��"@�M&Qܜ���r���Sc5��D�ض#�۲�i�b�qMX��TUn��7Qh�r`°�)1s[R��sKVAn��Lǯ���
H�ZPY�kKP66a!'!�F��iOz�C"ڰ!�juM����f��yU9k��إ�a�5'��:�kO]��k"S6���%��P�!j��'����9o��L��cm��6��l����AͲ\;Z�N��*���[gP�X	n$��Ô؛.&´ֳH&��d���r�gϓ�"[&�D���VkZ�DJ�JƶdkRұ�m��s��>�:��j�kjUYQdm	��kH����j�7DL D���Ù�s���M�K�b�Z���YZ�ݷ���sT�������-��w��#h�b,UD�kuuY��kF��]UgϵjZ���8�p��Mz�֨9J���֞��h�Ok_>�Tf6���������I$�I$�I$�� x`  ���� �w�k�\���Ǜ��>u�\��[�������\���q��u��u�=s���|�ǝm�;���k�w�<m�{s�s�;��<s�u�}q�|s����\s�|��[����R j&�
(�NU�������k9���lG5�et�6Ū⚱�����,���Fۓ n�I��ڔ���Z�vH�`>=~ƧPRE�J5�ij��$"��6��Y-)�\�d[V�7�CN�����ZF��*���MlR԰僚���U�b5����测m�)�J*7)0�"B�nN+6-�w�lr�(����X�uSl�q���d��F�m�����t��WO��:���-ėxr�e��XV��i�4,��a�NQ,��}�KdԀ"�RQ+5�h"%U�c[25�iX�6�k9��Vt�ቒ�@�Ԫ����]T֑IC[X��n��@�cc�� ��\ܪojX����֖�j��f����#��8�W���l�V��6dmLA��J���n��5�-h��˪����KS��\b8{T��DkT
��V�FkOgc4X����n��
