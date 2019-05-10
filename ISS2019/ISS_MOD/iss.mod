set D; #��n�̏W��
set P; #����̏W��
set N; #���C���̏W��   
set V; #�ԗ��̏W��
set S; #���̏W��


var z_delay{S,V,N} >=0;  #���������ƒʕ񎞍��̍���\��0-1�ϐ�
var y{D,V} binary;  #�ԗ�K�͊�nI�ɏ�������0-1�ϐ�
var x{S,P,V,N} binary;#���C��N�Ŏԗ�K�͌���J�ɃT�[�r�X��񋟂���0-1�ϐ�
var z_return{S,V,N}>=0;       #��n�֖߂鎞��
var z_arrival{S,V,N}>=0;       #����ɓ�������
var z_travel{S,V,N}>=0;   #���C��N�ɓ����܂ł̏��v����
var z_dispatch{S,V,N}>=0;       #�o������
var z_end{S,V,N}>=0;       #�T�[�r�X�������� 
var z_dis{S,V,N};#�撅�ԗ��ƌ㒅�ԗ��̓����������̈ᔽ��

param t_travel{S,P,D} default 0;       #��nI���猻��J�܂ł̎���
param t_call{S,P} default 0;       #�ʕ񎞍�
param t_service{S,P} default 0;         #����ł̍�Ǝ���
param demand{S,P} default 0;       #����̎ԗ��v����
param M;                      #�傫���萔
param t_setup{S,P} default 0;            #�ʏ�o���O�̏�������



minimize Objective:sum{s in S,n in N,v in V}z_delay[s,v,n]+sum{s in S,n in N,v in V}z_dis[s,v,n];

subject to C1{v in V}:   #�ԗ��̏��������߂�
sum{d in D}y[d,v]==1;

subject to C2{s in S,n in N,v in V}: #�e�ԗ��͂��ꂼ��̃��[���ō��X��̌���ɑ��݂��� 
sum{p in P}x[s,p,v,n]<=1;

subject to C3{p in P,s in S}:   #����̎ԗ��v�����𖞂���
demand[s,p]==sum{v in V,n in N}x[s,p,v,n];

subject to C4{s in S,n in N,v in V}: #�ԗ�K�͌���J�ւ̏o���񐔂͍��X���
sum{n in N}x[s,p,v,n]<=1;

subject to C5{s in S,n in N,v in V}: #����ւ̓��������̐���
z_arrival[s,v,n]==z_dispatch[s,v,n]+z_travel[a,v,n];

subject to C7{s in S,n in N,v in V:n>=2}: #���̌���ւ̏o�������͑O�̎ԗ�����n�֖߂鎞�����ȏ�
z_return[s,v,n-1]+sum{p in P}x[s,p,v,n]*z_setup[s,p]<=c[s,v,n];

subject to C8{s in S,p in P,d in D,n in N,v in V}: #��n�ƌ���̈ړ����Ԃ�\��
z_travel[s,v,n]>=t_travel[s,p,d]-(1-x[s,p,v,n])*M-(1-y[d,v])*M;

subject to C9{s in S,n in N,v in V}: #����ł̍�Ǝ����̕\��
z_end[s,v,n]==z_arrival[s,v,n]+sum{p in P}x[a,p,v,n]*t_service[s,v]-z_dis[s,v,n];

subject to C10{s in S,n in N,v in V}: #����ł̊��������Ɗ�n�֖߂鎞���̊֌W
z_end[s,v,n]+z_travel[s,v,n]==z_return[s,v,n]-z_dis[s,v,n];

subject to C11{s in S,n in N,v in V}: #�o���O�̏������Ԃ̐���
z_dispatch[s,v,n]-sum{p in P}x[s,p,v,n]*t_call[s,p]>=sum{p in P}x[s,p,v,n]*t_setup[s,j];

subject to C12{s in S,n in N,v in V}: #���������ƒʕ񎞍��̍���\��
z_delay[s,v,n]==z_arrival[s,v,n]-sum{p in P}x[s,p,v,n]*t_call[s,p];

subject to C13{s in S,p in P,v in V,n in N,v1 in V,n1 in N:v!=v1&&demand[s,p]==2}: #���������ƒʕ񎞍��̍���\��
z_dis[s,v,n]>=z_arrival[s,v,n]-z_arrival[s,v1,n1]-(1-x[s,p,v,n])*1440-(1-x[a,j,v1,n1])*1440;

