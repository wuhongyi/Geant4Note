<!-- G4VRestContinuousProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 05:23:09 2018 (+0800)
;; Last-Updated: 二 8月  7 05:23:56 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VRestContinuousProcess

**public G4VProcess**

Abstract class which defines the public behavior of discrete physics interactions.

## class

```cpp
  //  Abstract class which defines the public behavior of
  //  discrete physics interactions.
  public:     

      G4VRestContinuousProcess(const G4String& ,
			       G4ProcessType   aType = fNotDefined );
      G4VRestContinuousProcess(G4VRestContinuousProcess &);

      virtual ~G4VRestContinuousProcess();

  public:   //  with description

      virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& ,
			     G4ForceCondition* 
			    );

      virtual G4VParticleChange* AtRestDoIt(
			     const G4Track& ,
			     const G4Step&
			    );

      virtual G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4double previousStepSize,
			     G4double currentMinimumStep,
			     G4double& currentSafety,
                             G4GPILSelection* selection
			    );

      virtual G4VParticleChange* AlongStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    );
 
     //  no operation in  PostStepDoIt
      virtual G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& ,
			     G4double ,
			     G4ForceCondition*
			    ){ return -1.0; };

     //  no operation in PostStepDoIt
      virtual G4VParticleChange* PostStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    ) {return 0;};

  protected: //  with description
    virtual G4double GetContinuousStepLimit(const G4Track& aTrack,
                             G4double  previousStepSize,
                             G4double currentMinimumStep,
			     G4double& currentSafety
                                                             )=0;
   // This pure virtual function is used to calculate step limit
    // for AlongStep in the derived processes  

  private:
    // this is the returnd value of  G4GPILSelection in 
    // the arguments of AlongStepGPIL()
    G4GPILSelection  valueGPILSelection;

  protected://  with description
    // these two methods are set/get methods for valueGPILSelection
    void SetGPILSelection(G4GPILSelection selection)
    { valueGPILSelection = selection;};

    G4GPILSelection GetGPILSelection() const{return valueGPILSelection;};

  protected: //  with description

      virtual G4double GetMeanLifeTime(const G4Track& aTrack,G4ForceCondition* condition)=0;
      //  Calculates the mean life-time (i.e. for decays) of the
      //  particle at rest due to the occurence of the given process,
      //  or converts the probability of interaction (i.e. for
      //  annihilation) into the life-time of the particle for the
      //  occurence of the given process.

  private:
  // hide default constructor and assignment operator as private 
      G4VRestContinuousProcess();
      G4VRestContinuousProcess & operator=(const G4VRestContinuousProcess &right);
```

<!-- G4VRestContinuousProcess.md ends here -->
