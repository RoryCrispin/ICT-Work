#Print instructions and take user input from the console.
dimensions = raw_input('Welcome to PaintSim2000 \n Enter the room dimensions with format: \n length*width*height in meters. \n').split('*')
#Split the input into a list by * chars ^^
paintType  = raw_input('Would you like A Luxuary, B: Standard or C: Economy paint?\n')
undercoat  = raw_input('Would you like an undercoat? Y/N \n')

dimensions = map(float, dimensions) #Shange the dimenstions Array (List) of Strings into a list of Floats 

#Check from pre-defined criteria that the dimensions are within the range

if(dimensions[1] >25 or dimensions[1] <2 or dimensions[0] >25 or dimensions[0] <2):
	print 'The room is too long/short to paint, reconsider architecture and retry'
if(dimensions[2]>6 or dimensions[2]<2):
	print 'The room is too short/tall to paint, reconsider architecture and retry'

#Attempt to run the calculation, if it fails the try/catch method will display an error message
try:
	#Convert the String 'A|B|C' paint type to an int val I can multiply
	if(paintType == 'A'):
		paintCost = 1.75
	elif(paintType == 'B'):
			paintCost = 1.00
	elif(paintType == 'C'):
			paintCost = 0.45

	#Check if an undercoat required 
	if (undercoat == 'Y'):
		paintCost+=0.50

	#Calculate the area of the four walls
	area = (2*dimensions[0]*dimensions[2])+(2*dimensions[1]*dimensions[2])

	#Print recipt
	print '*********** PaintSim2000 ***********'
	print 'Area: ', area, "m^2"
	print 'Paint Type: ', paintType
	print 'Undercoat', undercoat
	print 'Paint cost per m^2:', paintCost 
	print 'Total cost:', area*paintCost
	print 'Thank you for using PaintSim2000'
	print '************************************'
except Exception, e: #If somethign goes wrong with the above calculation
	print 'Something went wrong. Were your inputs incorrect?'

