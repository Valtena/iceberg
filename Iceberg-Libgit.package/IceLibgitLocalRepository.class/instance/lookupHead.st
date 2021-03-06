private
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		repo isUnborn ifTrue: [ 
			^ IceUnbornBranch inRepository: self frontend ].
		head := repo head.
		^ head isBranch 
			ifTrue: [ IceLocalBranch named: head name inRepository: self frontend ] 
			ifFalse: [ head object asIcebergObjectInRepository: self ] ]