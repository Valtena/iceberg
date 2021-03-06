tests
testCloneLowLevel
	| branch backend |
	self skip.
	repository origin: (IceRemote url: 'ssh://github.com/pharo-vcs/pharo-git-test.git').
	
	backend := (repository storageClass 
		newRepositoryAt: repository location
		origin: repository origin
		subdirectory: '').
	
	backend frontend: self.

	LGitGlobal runSequence: [ 
		| repo |
		repo := LGitRepository on: repository location.
		repo cloneSsh: 'ssh://github.com/pharo-vcs/pharo-git-test.git'.
		repo open.

		(LGitRemote of: repo named: 'origin')
			lookup;
			setUrl: self origin url.

		repo checkout: 'master'.
	]
