# Chain of Command Army Builder

## Andrew Kinnie

A sample app written in the Swift programming language.  The app is specifically targeted at a user who is a player of the game "Chain of Command" by [Too Fat Lardies](https://toofatlardies.co.uk/product-category/chain-of-command/) 

Initial MVP is to provide the user a means to create forces for a game, and will be drawing off data in json format bundled with the app, and based on the data in the rulebook for the default forces in the book for the different nationalities.  

- Subsequent versions could: 
  - add other force options from other "Pint Sized Campaigns" or 
  - have the user provide their own custom forces.  
  - The app could also load external json files and use those as additional options.

## Use Cases:

### Load Data

Data:
- internal json file containing default platoons and support lists for each nationality

Happy Path:
1. Execute load data functionality from the file
2. System finds the file 
3. System parses the file and effectively validates it
4. System creates the appropriate model items
5. System displays the resulting data to the user

Unhappy Path (missing data):
1. System cannot find the file
2. System displays an error to the user

Unhappy Path (corrupt data):
1. System finds file
2. System unable to parse the file
3. System displays an error to the user

Unhappy Path (empty data):
1. System finds the file
2. System parses the file
3. System finds no valid data objects
4. System displays an error to the user indicating that the data is empty (same error as missing data path)

### Display Data/UI

Happy Path
- Choice of Nationality
  1. System displays resulting data to the user in a list of nationalities
  2. User can select a nationality from the list

- Choice of core platoon
  1. System displays a list of platoons available for the selected nationality
  2. User can select a platoon from the list

- View and adjust if necessary, the core platoon
  1. System displays the default organization for that platoon with the appropriate force rating
  2. User can make minor adjustments to the organization, 
  3. If necessary, System will adjust the force rating with the net modifier displayed (e.g. if it was +1 and is now +2), this will be indicated
  
- Select opponent force rating
  1. User can enter their opponent's support rating
  2. System determines force rating differential and available support points for the user.
  3. **Post MVP** User can select the scenario
  4. **Post MVP** User can select attacker or defender
  5. **Post MVP** User can choose support
  
- **Post MVP** Choice of Support
  1. **Post MVP** System loads support list for the selected nationality/platoon
  2. **Post MVP** User can select support elements from the list, up to their force differential (factoring in the scenario)

- Save resulting list to a file.


