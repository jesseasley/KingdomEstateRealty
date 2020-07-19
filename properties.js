
var propertyData = '({"properties": [' +
    '{"current":"0", "premier":"0", "address":"3113 Calstone<br>Highland Village", ' +
    '"caption":"Wonderful Home for Lease", "image":"http://www.easleyrealty.com/images/3113CalstoneLeased.jpg", ' +
    '"description":"Wonderful home with 3 car garage on oversized cul-de-sac lot! High ceilings, open floorplan &amp; warm designer colors! Lots of storage with 250 sq ft of floored walk-in attic! Spacious &amp; luxurious Owners Retreat! Flexible floorplan with full bed-bath downstairs! Media Room with 7.1 in-wall surround sound! Near the lake, fine dining &amp; shopping at The Shops of Highland Village! Minutes to DFW Airport! Exemplary Schools! Come see!"}' +
    ',{"current":"0", "premier":"0", "address":"1423 Chinaberry<br>Lewisville", ' +
    '"caption":"Great Location", ' +
    '"image":"http://www.easleyrealty.com/images/1423chinaberrysold.jpg", ' +
    '"description":"MOVE-IN READY! This home is immaculate. Lots of space and tastefully decorated throughout. Many upgrades inside and out. All upgrades and updates professionally done. Fireplace in master. Beautiful kitchen that is open to family area. Professionally remodeled into a four bedroom layout. You won&#39;t believe the deck and hot tub out back. MUST SEE!"}' +
    ',{"current":"0", "premier":"0", "address":"4120 Buckthorn Ct<br>Flower Mound", ' +
    '"caption":"More For The Money", "image":"http://www.easleyrealty.com/images/4120buckthornsold.jpg", ' +
    '"description":"More square footage for the money. The square footage price is low for Timber Creek. Charming three bedroom, 2.5 bath in quiet cul-de-sac. With four living areas and two fireplaces, this house is great for family gatherings or entertaining. Plenty of extra parking when they come to visit too. Immaculate, galley style kitchen boasts a new gas range. With three separate patios, you re sure to find a place to enjoy your morning coffee."}' +
    ',{"current":"0", "premier":"0", "address":"924 Boxwood, Lewisville", ' +
    '"caption":"Great Starter", "image":"http://www.easleyrealty.com/images/924boxwoodsold.png", ' +
    '"description":"This 3 bdrm, 2 bath is in excellent condition. Enjoy picture perfect Christmas&#39; around a stately brick fireplace and surrounded by elegant maple paneling. Loads of extra storage space. Ceiling fans throughout help you keep those energy bills low. Loads of counter space in the kitchen and efficient pull-outs in some cabinets. Easy maintenance yard has grassy areas to play, huge storage room for extra space, flower garden, patio and more."}' +
    ',{"current":"0", "premier":"0", "address":"709 Inglewood Dr<br>Flower Mound", ' +
    '"caption":"Backyard Oasis", "image":"http://www.easleyrealty.com/images/709InglewoodSold.png", ' +
    '"description":"As you would expect from the house of a handyman, this house is flawless. MUST SEE TO BELIEVE! Oversized, updated kitchen with granite, lots of natural light and open to living areas. Architectural pool with waterfall. Oversized master suite with sitting area. Pool deck extended and custom outdoor kitchen added on. Yard lighting system. Lighting and ceiling fans upgraded throughout house. 3 large storage areas in attic. New roof July &#39;08."}' +
    ',{"current":"0", "premier":"0", "address":"2430 Antler Trl<br>Lewisville", ' +
    '"caption":"An In-Demand Location", "image":"http://www.easleyrealty.com/images/2430antlersold.png", ' +
    '"description":"LOOK AT ALL THESE UPDATES! HVAC, stove, microwave, carpet, tile, garage door, garage door opener, water heater, fence and sprinklers. This home has a beautiful and open living area as well as a loft that s perfect for gaming, a home office or a forth bedroom. It&#39;s move-in ready and will move fast. Come take a look while it&#39;s still available."}' +
    ',{"current":"0", "premier":"0", "address":"4950 Lusk Ln<br>Flower Mound", ' +
    '"caption":"Perfect Location", "image":"http://www.easleyrealty.com/images/4950LuskSold.png", ' +
    '"description":"Gorgeous house with lots of upgrades. Originally built in &#39;85, it had a significant addition added on in &#39;03. The roof was replaced in &#39;03 as well. Three fireplaces, including one in the master bedroom. Oversized three car garage, completely finished, including insulated doors and it&#39;s own zone for air conditioning. Lots of built-ins. Lots of fine woodworking. The property is on city water, but has a well that could be used for sprinklers."}' +
    ',{"current":"0", "premier":"0", "address":"2820 Northshore, Flower Mound", ' +
    '"caption":"Classic Flower Mound Beauty", "image":"http://www.easleyrealty.com/images/2820northshoreleased.png", ' +
    '"description":"Excellent floor plan with spacious smartly decorated rooms. Hardwood in entry and hall, designer carpet in family room. Italian ceramic in kitchen nook and all baths. 5th bedroom could be game room. Walk to pool and park. Immaculate home. Just bring application."}' +
    ',{"current":"0", "premier":"0", "address":"2517 Brandywine<br>Flower Mound", ' +
    '"caption":"Quiet Neighborhood", "image":"http://www.easleyrealty.com/images/2517brandywinesold.png", ' +
    '"description":"Beautiful home with open floor plan, many upgrades including new roof. Large tiled entry leads to formal dining with crown molding. Spacious kitchen has recessed lighting, gas cooktop, bkft bar &amp; tile backsplash,opens to main LA with fireplace &amp; cath.ceiling. Upstairs has 2nd LA, with built-in desk,3 large secondary bedrooms with vaulted ceilings. Master has door to back patio, wood floor, crown molding, garden tub, sep shower &amp; sep vanities."}' +
    ',{"current":"0", "premier":"0", "address":"1407 Chinaberry<br>Lewisville", ' +
    '"caption":"Great Location", "image":"http://www.easleyrealty.com/images/1407chinaberrySold.png", ' +
    '"description":"This house is immaculate. Super clean and new paint in most rooms. Heating and AC unit has been recently upgraded. Kitchen has lots of room. Family Room and Dining Room recently redone to show tasteful elegance. Great for entertaining! All bedrooms are up. Oversized master with spacious bathroom and his and hers walk-in closets. This home comes with an HWA Home Warranty."}' +
    ',{"current":"0", "premier":"0", "address":"9028 San Joaquin<br>Fort Worth", ' +
    '"caption":"Great Starter Home", "image":"http://www.easleyrealty.com/images/9028SanJoaquinLeased.png", ' +
    '"description":"Charming home with open floor plan. Family area is very large, with beautiful oversized tile, wood burning fireplace and access to patio. Master suite is oversized and perfect for relaxing after a hard day. Home is well manicured and in move-in ready condition. This home comes with an HWA Home Warranty."}' +
    ',{"current":"0", "premier":"0", "address":"1144 Pleasanton<br>Plano", ' +
    '"caption":"Gorgeous Home", "image":"http://www.easleyrealty.com/images/1144pleasantonleased.png", ' +
    '"description":"Impressive 2 story charmer on great oversized lot! Terrific home w-updates galore. Plantation shutters &amp; 2 in blinds. Hdwd flrs in DR, den, entry &amp; hall. Designer colors. Spacious den has FP w-custom mantle &amp; gas starter. Travertine flrs in 2 BAs. Gourmet kit w-island, brkfst bar, c-tile b-splash &amp; bay win. Pl surrounded by wd deck in huge bckyrd w-lots of play area. Dwnstairs master bedroom has sep tub &amp; shower."}' +
    ',{"current":"0", "premier":"0", "address":"2311 Cross Timbers<br>Arlington", ' +
    '"caption":"Spacious Four Bedroom", "image":"http://www.easleyrealty.com/images/2311CrossTimbersLeased.png", ' +
    '"description":"Spectacular 4-2.5-2 with 2 living &amp; 2 dining areas! 2-Story home boasts gas fireplaces in both living areas! Kitchen includes appliances &amp; built-in desk area! Split bedrooms with walk-in closets, master suite features sitting area with bay window overlooking backyard which includes a fabulous multi level wood deck and sports court! Alarm system, sprinkler system, ceiling fans throughout &amp; more!"}' +
    ',{"current":"0", "premier":"0", "address":"5583 Rocky Mountain<br>Fort Worth", ' +
    '"caption":"Large 5 Bedroom Home", "image":"http://www.easleyrealty.com/images/5583RockyMountainLeased.png", ' +
    '"description":"Large 5 bedroom home in a cul de sac with formals, master bath with jetted tub, kitchen with breakfast bar. HUD HOME TO BE SOLD AS-IS, ELECTRONIC BID DEADLINE 4-05-09 AT 11:59 PM, PST, THEN DAILY BIDS OPEN - HUD CASE # 492-790677 - BUYER TO VERIFY ALL INFORMATION. SQUARE FOOTAGE INFORMATION IS FROM THE FHA APPRAISAL AND IS DEEMED RELIABLE BUT NOT GUARANTEED"}' +
    ']})';
var testimonials = "";
var articles = "";