<!-- G4VRestContinuousDiscreteProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 05:25:28 2018 (+0800)
;; Last-Updated: 二 8月  7 05:26:32 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VRestContinuousDiscreteProcess

**public G4VProcess**

Abstract class which defines the public behavior of continuous and discrete physics interactions.

## class

```cpp
  //  Abstract class which defines the public behavior of
  //  discrete physics interactions.
  public:     

      G4VRestContinuousDiscreteProcess(const G4String& ,
				       G4ProcessType   aType = fNotDefined );
      G4VRestContinuousDiscreteProcess(G4VRestContinuousDiscreteProcess &);

      virtual  ~G4VRestContinuousDiscreteProcess();


  public :// with description
      virtual  G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4double   previousStepSize,
			     G4ForceCondition* condition
			    );

      virtual  G4VParticleChange* PostStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    );

      virtual  G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4double previousStepSize,
			     G4double currentMinimumStep,
			     G4double& currentSafety,
                             G4GPILSelection* selection
			    );

      virtual  G4VParticleChange* AlongStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    );
 
      virtual  G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& ,
			     G4ForceCondition* 
			    );

      virtual  G4VParticleChange* AtRestDoIt(
			     const G4Track& ,
			     const G4Step&
			    );

  protected: // with description
      virtual G4double GetMeanLifeTime(const G4Track& aTrack,G4ForceCondition* condition)=0;
      //  Calculates the mean life-time (i.e. for decays) of the
      //  particle at rest due to the occurence of the given process,
      //  or converts the probability of interaction (i.e. for
      //  annihilation) into the life-time of the particle for the
      //  occurence of the given process.

    virtual G4double GetContinuousStepLimit(const G4Track& aTrack,
                             G4double  previousStepSize,
                             G4double  currentMinimumStep,
			     G4double& currentSafety
                                                             )=0;
  private:
    // this is the returnd value of  G4GPILSelection in 
    // the arguments of AlongStepGPIL()
    G4GPILSelection  valueGPILSelection;

  protected: // with description
    // these two methods are set/get methods for valueGPILSelection
     void SetGPILSelection(G4GPILSelection selection)
    { valueGPILSelection = selection;};

    G4GPILSelection GetGPILSelection() const{return valueGPILSelection;};

  protected: // with description
     virtual G4double GetMeanFreePath(const G4Track& aTrack,
                             G4double   previousStepSize,
                             G4ForceCondition* condition
                                                               )=0;
      //  Calculates from the macroscopic cross section a mean
      //  free path, the value is returned in units of distance.

 private:
  // hide default constructor and assignment operator as private 
      G4VRestContinuousDiscreteProcess();
      G4VRestContinuousDiscreteProcess & operator=(const G4VRestContinuousDiscreteProcess &right);
```

<!-- G4VRestContinuousDiscreteProcess.md ends here -->
