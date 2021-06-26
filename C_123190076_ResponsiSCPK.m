clc;clear;%hapus

%Data Import
data=xlsread('Real estate valuation data set.xlsx','C2:E51');
harga = xlsread('Real estate valuation data set.xlsx','H2:H51'); 
raw=[data harga]; %menggabungkan data dan harga

k=[1,0,1,0]; %0= cost,1 = benefit, atribut kriteria

w = [3,5,4,1];%nilai bobot tiap kriteria

[m n]=size(raw);%perbaikan bobot
w=w./sum(w);

for j=1:n,%melakukan perhitungan vektor per baris
    if k(j)==0,
        w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(raw(i,:).^w);
end;

data= S/sum(S);%proses perangkingan
Descend=sort(data,'descend')
skor_tertinggi = max(data) 