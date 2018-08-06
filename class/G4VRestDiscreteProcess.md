<!-- G4VRestDiscreteProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 05:21:22 2018 (+0800)
;; Last-Updated: 二 8月  7 05:22:21 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VRestDiscreteProcess

**public G4VProcess**

Abstract class which defines the public behavior of rest + discrete physics interactions.

## class

```cpp
  //  Abstract class which defines the public behavior of
  //  rest + discrete physics interactions.
  public:     

     G4VRestDiscreteProcess(const G4String& ,
			    G4ProcessType   aType = fNotDefined );
     G4VRestDiscreteProcess(G4VRestDiscreteProcess &);

     virtual ~G4VRestDiscreteProcess();

  public :// with description
     virtual G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4double   previousStepSize,
			     G4ForceCondition* condition
			    );

     virtual G4VParticleChange* PostStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    );

     virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& ,
			     G4ForceCondition* 
			    );
      
     virtual G4VParticleChange* AtRestDoIt(
			     const G4Track& ,
			     const G4Step&
			    );

     //  no operation in  AlongStepDoIt
     virtual G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track&,
			     G4double  ,
			     G4double  ,
			     G4double& ,
                             G4GPILSelection*
			    ){ return -1.0; };

     //  no operation in  AlongStepDoIt
     virtual G4VParticleChange* AlongStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    ) {return 0;};
 
  protected:// with description
     virtual G4double GetMeanFreePath(const G4Track& aTrack,
                             G4double   previousStepSize,
                             G4ForceCondition* condition
                           )=0;
      //  Calculates from the macroscopic cross section a mean
      //  free path, the value is returned in units of distance.

     virtual G4double GetMeanLifeTime(const G4Track& aTrack,G4ForceCondition* condition)=0;
      //  Calculates the mean life-time (i.e. for decays) of the
      //  particle at rest due to the occurence of the given process,
      //  or converts the probability of interaction (i.e. for
      //  annihilation) into the life-time of the particle for the
      //  occurence of the given process.

  private:
  // hide default constructor and assignment operator as private 
      G4VRestDiscreteProcess();
      G4VRestDiscreteProcess & operator=(const G4VRestDiscreteProcess &right);
```

<!-- G4VRestDiscreteProcess.md ends here -->
