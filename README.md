# Selected-project
expert system 
======================================================================
our rules 
======================================================================
if electricity on
and charging lamp off \n
    then charger problem            {cf=90}

if no battery exist 
and no power in laptop
    then charger problem            {cf=90}

if charger connceted 
and charger lamp on 
    then not charged                {cf=80}

if not charged 
    then battery                     {cf=90}

if battery charged
and no power in laptop
    then battery                    {cf=90}


 if labtop fall down 
    then Ram problem                {cf=80}


if Bios screen doesn't count Ram 
    then Ram problem                {cf=100}


if labtop fall down
and screen get bad resoluation 
    then display card problem       {cf=80}

if labtop fall down
and screen get red lines  
    then display flat  problem     {cf=90}

if hear os start 
and Black display appear
    then display mode problem       {cf=80}

if hear os start 
and computer fall down
    then display  problem       {cf=80}

if not hear fan sound 
    then cpu fan problem        {cf=90}

if high temperature 
    then aircondition           {cf=100}

if aircondition 
and uncomfortable sound 
    then cpu fan problem        {cf=90}


if windows restart when load it's file 
    then windows doesn't continue open  {cf=100}

if  windows doesn't continue open
and flashed screen 
    then os problem                 {cf=100}

if Blue page opend 
    then os problem                  {cf=100}


if windows open disktop then restart 
    then os problem                    {cf=90}

if windows get on deadlock
    then os problem                     {cf=100}

if address error message 
and computer restart 
    then can't load os                   {cf=90}

if can't load os 
and power lamp on 
    then hard drive problem             {cf=90}

if smell smoke
    then board problem                  {cf=100}

if drink fall on computer 
    then board problem                  {cf=100}

if computer fall down 
and smell smoke
    then board problem                  {cf=100}

if power lamp doesn't on when click power button 
    then power button problem              {cf=70}
    
===============================================================================


