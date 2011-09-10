Build by Maw begins here.

Part - Change Builds

builds is an action applying to nothing.
Understand "plan" as builds.

Check builds:
	if blueprints is not visible, say "You can't check your building designs without... your designs!" instead;

carry out builds:
	say "Available Designs: [no line break]";
	repeat with x running through valid construct:
		if x is complete, next;
		say "[line break]";
		say "[x]([progress of x]/[cost of x])[if building of blueprints is x](building construction)[end if][no line break]";
	say "To begin a new build, type [bold type]build (building) at (direction)[roman type].";

constructing is an action applying to one thing and one visible thing.
Understand "Build [any Construct] at [direction]" as constructing.
Understand "Build [Construct] in [direction]" as constructing.
Understand "Build [Construct] to [direction]" as constructing.

Check constructing:
	if blueprints is not visible, say "You can't give orders to your builders while you don't have your designs with you!" instead;
	if noun is complete or noun is placed, say "That building has already been constructed" instead;
	if noun is building of blueprints and blueprints is started, say "Your builders stare at you, hammers and two-by-fours in hand, looking about ready to hammer you upside the head with both, 'We are working on it.' Maybe you should hire more builders?" instead;

Carry out constructing:
	say "[description of noun]";
	say "[line break]Construct?";
	if the player consents:
		now building of blueprints is noun;
		now origin of blueprints is location of player;
		now facing of blueprints is second noun;
		now blueprints is started;
		say "Your builders begin constructing [noun].";
	otherwise:
		say "Aborted.";


Book - Define Construct


A Construct is a kind of room.
A Construct can be placed.
A Construct has a rule called validation.
The validation of a Construct is usually warvailable rule.
A Construct has a number called progress.
A Construct has a number called cost.
A construct has a text called perk.
A Construct has a rule called completion.
The completion of a Construct is usually nothing rule;

Definition: A Construct (called C) is valid:
	follow the validation of C;
	if rule succeeded:
		yes;
	otherwise:
		no;

Definition: A Construct (called C) is complete:
	if progress of C >= cost of C:
		yes;
	otherwise:
		no;


Book - Dem Blues

A print is a kind of thing.
A print has a construct called building.
A print has a room called origin.
A print has a direction called facing.
A print can be started.
blueprints is a print. "A large sheet of dark-blue paper with thin, light blue lining upon the broad face of it. With a little ingenuity one could consider this a invaluable tool to [bold type]plan[roman type] buildings.".
blueprints is in Village center.

After examining the blueprints:
	if progress of building of blueprints < cost of building of blueprints:
		say "building Construction Designs: [building of blueprints]([progress of building of blueprints]/[cost of building of blueprints])";
	say "[line break]To begin a new build, type [bold type]build (building) at (direction)[roman type].";
	say "Type [bold type]plan[roman type] alone to see available buildings.";

Part 2 - Constructs


cur is a text that varies.

Agricultural Zone is a Construct.
The description of it is "A massive, flat area filled with rows upon rows of[one of] wheat[or] corn[or] tomato stalks[or] apple trees[or] grape vines[or] marijuana.[sticky random] You feel at peace here, the wildlife of the area unperterbed and singing happily. The rustic look quite an eyesore for the city-folk. (Increases farmers' efficency by offering organized plot of farmland (No effect on hunters))".
The cost of it is 60.
The validation of agricultural zone is agricheck rule.
The proximity of it is "You smell tilled earth to the";

This is the agricheck rule:
	if farming is complete, rule succeeds;
	rule fails;

Book - Building!

An everyturn rule(this is the Can We Build It rule):
	if blueprints is not started, continue the action;
	if building of blueprints is complete:
		say "Your current building project is complete. You should pick a new one.";
		continue the action;
	let foragers be workers of builder; [ builders not defined]
	now foragers is foragers * 10; [ Builders are worth 10 points each ]
	increase foragers by 2 * ( population of tribe of player - occupied of tribe of player ); [ idle people are worth 2 points each ]
	[First check for easy to grab salvage, will become more scarce over time]
	let x be a random number from 80 to 120; [mild variance]
	increase x by (Handiness of tribe of player) / 5;
	if "Deft" is listed in perks of tribe of player:
		increase x by 20;
	now x is x / 100;
	if x is greater than 0: [ There is building to be done ]
		if x is less than 1, now x is 1;
		say "Your construction advances: +[x]";
		increase progress of building of blueprints by x;
		if building of blueprints is complete:
			say ". [bold type][current of nerd][roman type] is complete!";
			follow the completion of building of blueprints;
			if the perk of building of blueprints is not "":
				add the perk of building of blueprints to perks of tribe of player;
			change the facing of blueprints exit of origin of blueprints to building of blueprints;
			change the opposite of facing of blueprints exit of building of blueprints to origin of blueprints;
			now building of blueprints is placed;

Book - Builders

builder is a job.
The validation of builder is the buildervailable rule.
The maximum of builder is maxbuilder rule.

This is the maxbuilder rule:
	now max of builder is population of tribe of player;

This is the buildervailable rule:
	let x be the number of valid incomplete constructs;
	if x is 0, the rule fails;
	the rule succeeds;

Build ends here.
