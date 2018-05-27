# fastbois- James Huang, Stefan Tan, Shafali Gupta
Final Project Repo. 
## City.java
What makes a city a city? Is it the people who populate it? Is it the structures that exist? Cities exist all across the world; after all  
they are what makes our modern society possible. As fellow urbanites ourselves, we are part of a vast organism that is arguably just as  alive as its constituent parts(that is, humans). From New York to Mumbai, people flock to cities to seek out opportunities, and across the world, there are many striking similarities from city to city.

Based on that premise, can we model any city? Can we construct our own city, play around with it, and improve upon it? Can a super-complex,
intricately linked aspect of human society be reduced to lines of code?

With our project, we aim to discover and answer that question with our **city simulation**
## Our Goal
The end goal, of course, is to create a reasonably accurate simulation that takes into account many factors, with a simple GUI output using processing and backend usage of data structures(such as a doubly linked list or a heap), to accurate visualize links in the complex web of a city. 
## Our Plan
As this is an exploratory project by nature, we have a **4 phased plan**, with progressively increasing levels of complexity. 
### Phase 1
**Summary:** Have a superclass representing a Person, have a superclass representing a Building, decide on an appropriate data structure to store data in Government, and have some sub-classes of Person, Building, and Transportation worked out.
#### Classes
1. **Person**:People make up cities, and we will have an abstract class that constructs a default person. A person will have an address(probably just a coordinate system), an age, an income, and a work/education profession(dependent on age). A person will be capable of interacting with other people.
2. **Building**: Buildings are pretty imporant. They are where people live, work, or play(this category will also include PARKS, ROADS, and any other structure). Depending on the type of building, people will either go over it, play in it, work in it, or live in it. Buildings will have set locations, and will keep track of the people passing through them. They have capacities.
3. **Transportation**: People can either walk, or take a car in the initial phase of our rollout. Cars take up more room, and can only run on roads. 
4. **Government:** stores all the data for people.
### Phase 2
**Summary:** add more subclasses for each superclass, introduce an income system, add more features to buildings, government and person classes.
#### Classes
1. **Person:** A person will be capable of interacting with other people. There will be a relationship bar, people will have perosnal preferences.
2. **Buildings**: more buildings! There will be an option to rapidly build certain types of buildings.
3.**Transportation:** Buses and bikes!
4. **Government:** tax collection, basic law and order
#### GUI
1. **Basic map:** shows where all buildings are!
2. **Statistics:** Visualization of number of people passing through area in given period of time.
3. **Government Statistics:** visualization of population, traffic, safety, happiness
### Phase 3
**Summary:** add more features! People will now learn to change their preferences, people have more free-will. Sliders to adjust features. More "social" aspects added.
#### Classes
1. **Person:** people will adapt based on interactions with other people, the law, etc. People will commit crimes, will band together, and depending on their happiness, will perform certain actions. People can move out
2. **Neighborhoods:** A group of buildings forms a neighborhood. Neighborhoods have reputations etc., this affects the fate of those in the neighborhood. 
3.**Government:** Adjust the racism and oppression bar to see what happens! Government can now plan to alleviate city problems.
#### GUI
1. **More Statistics:** idk just some more stats that will help you understand the city more
2. **Visualization of traffic;** New menus to see just the traffic in a city. Statistics of roads in a different menu. you can rename roads and buildings
3. **Sliders:** Adjust the number of people, characteristics of people, government planning, and a lot more.
### Phase 4
**Summary:** LAYERS
#### Classes:
1. **BelowCity:** What happens below a city also affects what happens above. Subways, sewers, and water mains should be constructed to better provide for the needs of the people.
2. **Buildings:** People need to eat food, and there will be grocery stores. Add ports, rivers, and airports. Goods are transported in from there, and are exported out.
3. **Government:** the government has a budget, and it better be careful!
#### GuI
1. **refining our GUI:**

## Plan
**June 1st:** Phase 1 completely done  
**June 4th:** Phase 2 completely done  
**June 8th:** Phase 3 completely done  
**June 12th:** Phase 4 completely done  
