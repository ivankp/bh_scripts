#!/bin/sh

BIN=/home/ivanp/work/bh_analysis/bin

for n in 2; do
m=$(($n + 1))
for E in 8 13; do
  hadd ../hists/exclsums/H"$n$m"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4.root \
    ../hists/hists/H"$m"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4_RS.root \
    ../hists/hists/H"$m"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4_I.root \
    ../hists/hists/H"$m"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4_V.root \
    ../hists/hists/H"$n"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4_NLO.root

  $BIN/plot -i ../hists/exclsums/H"$n$m"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4.root \
            -o ../hists/exclsums/H"$n$m"j-ggf_"$E"TeV_HT2-unc_AntiKt4_CT10nlo_pt30-eta4.4.pdf \
            -t ": H"$n"&"$m"j ExclSum "$E"TeV"
done
done

