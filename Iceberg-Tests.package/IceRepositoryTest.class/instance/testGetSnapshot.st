tests
testGetSnapshot
	| snapshot def |
	snapshot := (repository packageNamed: packageName) latestVersion mcVersion snapshot.
	
	def := snapshot definitions detect: [ :dep | dep class = MCOrganizationDefinition ].
	self assert: def categories size equals: 1.
	self assert: def categories first equals: #'Pharo-Git-Test'.
	
	def := snapshot definitions detect: [ :dep | dep class = MCClassDefinition ].
	self assert: def className equals: #Test .

	def := snapshot definitions detect: [ :dep | dep class = MCMethodDefinition ].
	self assert: def selector equals: #versionNumber.
	self assert: def source notNil.
