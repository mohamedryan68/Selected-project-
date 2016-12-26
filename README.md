# Selected-project
expert system 
======================================================================
this system for computer problem diagnose with recommendation system soluation 
after diagnose user asked if he/she need recommended soluation or not 
======================================================================
our rules 
======================================================================
if computer doesn't turn on
and electricity 
and charging lamp off 
    then charger problem            {cf=90}
    
if no battery exist 
and no power in laptop
then electricity                    {cf=80}

if computer doesn't turn on
and battery exist 
and not charged 
then battery                        {cf=90}

if computer doesn't turn on
and battery exist 
and no power in labtop
then battery                        {cf=90}

if charger connceted 
and charger lamp on 
then not charged                {cf=80}


 if computer turn on
 and labtop fall down
 and desktop doesn't start 
    then Ram problem                {cf=80}


if  computer turn on
and labtop fall down
and Bios screen doesn't count Ram 
    then Ram problem                {cf=100}


if computer turn on
and desktop start 
and labtop fall down
and screen get bad resoluation 
    then display card problem       {cf=80}

if  computer turn on
and desktop start 
labtop fall down
and screen get red lines  
    then display flat  problem     {cf=90}

if computer turn on
and desktop doesn't start
hear os start 
and Black display appear
    then display mode problem       {cf=80}

if computer turn on
and desktop doesn't start 
hear os start 
and computer fall down
    then display  problem       {cf=80}

if computer turn on
and desktop doesn't start  
not hear fan sound 
    then cpu fan problem        {cf=90}

if high temperature 
    then aircondition           {cf=100}

if computer turn on
and desktop doesn't start 
and aircondition 
and uncomfortable sound 
    then cpu fan problem        {cf=90}


if windows restart when load it's file 
    then windows doesn't continue open  {cf=100}

if computer turn on
and desktop doesn't start 
and windows doesn't continue open
and flashed screen 
    then os problem                 {cf=100}
    
if computer turn on
and desktop  start 
and windows restart 
    then os problem                  {cf=100}

if computer turn on
and desktop  start 
and windows in deadlock
    then os problem                 {cf=90}
    
if computer turn on
and desktop  doesn't start 
and blue page
    then os problem                 {cf=90}
    
    
if computer turn on
and desktop  doesn't start 
and can't load os files 
    then hard drive problem         {cf=90}
    
    
if appear address error message 
and computer restart 
then can not load os files          {cf=100}

if computer doesn't turn on 
and smell smoke
then board                          {cf=90}

if computer doesn't turn on 
and fall drink
then board                          {cf=90}

if laptop fall down 
and smell smoke
then board                          {cf=90}

if not charger problem
and computer doesn't turn on
and not battery
then power button                   {cf=90}
    
===============================================================================


