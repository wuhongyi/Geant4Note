<!-- G4VRestProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 05:19:28 2018 (+0800)
;; Last-Updated: 二 8月  7 05:20:34 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VRestProcess

**public G4VProcess**

Abstract class which defines the public behavior of physics interactions at rest.

## class

```cpp
  //  Abstract class which defines the public behavior of
  //  physics interactions at rest.

  public:
      G4VRestProcess(const G4String&  ,
		     G4ProcessType   aType = fNotDefined );
      G4VRestProcess(G4VRestProcess& );

      virtual ~G4VRestProcess();

  public:   //  with description
      virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4ForceCondition* condition
			    );

      virtual G4VParticleChange* AtRestDoIt(
			     const G4Track& ,
			     const G4Step&
			    );

     //  no operation in  PostStepDoIt and  AlongStepDoIt
      virtual G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track&,
			     G4double  ,
			     G4double  ,
			     G4double& ,
	                     G4GPILSelection*
			   ){ return -1.0; };

      virtual G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& ,
			     G4double   ,
			     G4ForceCondition* 
			    ) { return -1.0; };

     //  no operation in  PostStepDoIt and  AlongStepDoIt
      virtual G4VParticleChange* PostStepDoIt(
			     const G4Track& ,
			     const G4Step&
			    ) {return 0;};

      virtual G4VParticleChange* AlongStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    ) {return 0;};
 
  protected: //  with description

      virtual G4double GetMeanLifeTime(const G4Track& aTrack,G4ForceCondition* condition)=0;
      //  Calculates the mean life-time (i.e. for decays) of the
      //  particle at rest due to the occurence of the given process,
      //  or converts the probability of interaction (i.e. for
      //  annihilation) into the life-time of the particle for the
      //  occurence of the given process.

 private:
  // hide default constructor and assignment operator as private 
      G4VRestProcess();
      G4VRestProcess & operator=(const G4VRestProcess &right);
```

<!-- G4VRestProcess.md ends here -->
