#!/bin/bash

tablica=('car' 'bus' 'train' 'bike')

echo "${tablica[@]}"
echo "${tablica[2]}"

tablica[2]='boat'

echo "${tablica[2]}"


unset tablica[2]

echo ${tablica[@]} #usuniecie elementu z tablicy
