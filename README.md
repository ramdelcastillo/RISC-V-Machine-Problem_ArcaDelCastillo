## LBYARCH RISC-V Machine Problem
<p align="justify">
This project simulates Pokémon battles by comparing type effectiveness. Each Pokémon’s types (limited to the first 100 Pokémon) are stored in memory, and their effectiveness against an opponent’s types is calculated using the multiplier table. For dual types, the effectiveness of each type is multiplied against both opponent types, and the results are averaged to get the Pokémon’s final score, while single-type Pokémon only have one score. The one with the higher score wins, or -1 is returned for a tie. This project should be run in <a href="https://github.com/TheThirdOne/rars/releases/download/v1.6/rars1_6.jar"><strong>RARS 1.6</strong></a>.
</p>
The effectiveness table will be seen below:
<img width="1027" height="501" alt="image" src="https://github.com/user-attachments/assets/ddd10c19-b821-4313-b3cb-c55b3440027f" />
<br><br>
Created by:<br> Althea Denisse Arca <br>
Jose Mari Del Castillo<br><br>
Submission Date: July 31, 2024
##
<div align="center">

<table width="100%">
  <tr>
    <td align="center" width="50%">
      <img width="340" height="627" alt="image" src="https://github.com/user-attachments/assets/362ad747-cffe-43e5-acac-b95736eb4dbc" />
    </td>
    <td align="center" width="50%">
<b>Test 1</b><br>
Charizard (#006, Fire/Flying) vs Venusaur (#003, Grass/Poison)<br>
→ Winner: Charizard (#006)<br><br>

<b>Test 2</b><br>
Raichu (#026, Electric) vs Psyduck (#054, Water)<br>
→ Winner: Raichu (#026)<br><br>

<b>Test 3</b><br>
Ivysaur (#002, Grass/Poison) vs Butterfree (#012, Bug/Flying)<br>
→ Winner: Butterfree (#012)<br><br>

<b>Test 4 (invalid input)</b><br>
Charmeleon (#005, Fire) vs -1<br>
→ Winner: 1st input (Charmeleon #005)<br><br>

<b>Test 5 (invalid input)</b><br>
-1 vs Golem (#076, Rock/Ground)<br>
→ Winner: 2nd input (Golem #076)<br>
    </td>
  </tr>
</table>

</div>
