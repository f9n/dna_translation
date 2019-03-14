#!/usr/bin/env perl
# Author: Fatih Sarhan
# License: GPL-3.0

use strict;
use warnings;

my $filename = 'dna_list.txt';
my %genetic_code_table = (
  'UUU' => 'F',
  'UUC' => 'F',
  'UUA' => 'L',
  'UUG' => 'L',
  'CUU' => 'L',
  'CUC' => 'L',
  'CUA' => 'L',
  'CUG' => 'L',
  'AUU' => 'I',
  'AUC' => 'I',
  'AUA' => 'I',
  'AUG' => 'M',
  'GUU' => 'V',
  'GUC' => 'V',
  'GUA' => 'V',
  'GUG' => 'V',
  'UCU' => 'S',
  'UCC' => 'S',
  'UCA' => 'S',
  'UCG' => 'S',
  'CCU' => 'P',
  'CCC' => 'P',
  'CCA' => 'P',
  'CCG' => 'P',
  'ACU' => 'T',
  'ACC' => 'T',
  'ACA' => 'T',
  'ACG' => 'T',
  'GCU' => 'A',
  'GCC' => 'A',
  'GCA' => 'A',
  'GCG' => 'A',
  'UAU' => 'Y',
  'UAC' => 'Y',
  'UAA' => '.',
  'UAG' => '.',
  'CAU' => 'H',
  'CAC' => 'H',
  'CAA' => 'Q',
  'CAG' => 'Q',
  'AAU' => 'N',
  'AAC' => 'N',
  'AAA' => 'K',
  'AAG' => 'K',
  'GAU' => 'D',
  'GAC' => 'D',
  'GAA' => 'E',
  'GAG' => 'E',
  'UGU' => 'C',
  'UGC' => 'C',
  'UGA' => '.',
  'UGG' => 'W',
  'CGU' => 'R',
  'CGC' => 'R',
  'CGA' => 'R',
  'CGG' => 'R',
  'AGU' => 'S',
  'AGC' => 'S',
  'AGA' => 'R',
  'AGG' => 'R',
  'GGU' => 'G',
  'GGC' => 'G',
  'GGA' => 'G',
  'GGG' => 'G',
);

sub read_file{
  open(FH, '<', $filename) or die "Can't open $filename: $!";
  my @lines;
  for my $line (<FH>) {
    chomp $line;
    push(@lines, $line)
  }
  close(FH) or die "Can't close $filename: $!";
  return @lines;
}

sub get_dataset{
  my @lines = read_file();
  return @lines;
}

sub main{
  my @dnas = get_dataset();
  
  print "Dnas: \n";
  for my $dna (@dnas) {
    print "\tDna: $dna\n";
    $dna =~ tr/TCAG/AGTC/;
    print "\tCounterpart of DNA: $dna\n";
    $dna =~ tr/T/U/;
    print "\tRna: $dna\n";
    my @codons = $dna =~ /[ACUG]{3}/g;
    print "\tCodons: @codons\n";
    my $result;
    for my $codon (@codons){
      if (exists $genetic_code_table{$codon}) {
        $result .= $genetic_code_table{$codon};
      }
    }

    print "\tResult: $result\n";
    print "\n";
  }
}

main();

