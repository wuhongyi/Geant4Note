<!-- G4VContinuousDiscreteProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:37:17 2018 (+0800)
;; Last-Updated: 六 7月 14 02:45:18 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4VContinuousDiscreteProcess


## class

```cpp
  //  Abstract class which defines the public behavior of
  //  discrete physics interactions.
  public:     

      G4VContinuousDiscreteProcess(const G4String& ,
				   G4ProcessType   aType = fNotDefined );
      G4VContinuousDiscreteProcess(G4VContinuousDiscreteProcess &);

      virtual ~G4VContinuousDiscreteProcess();

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

      virtual G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track&,
                             G4double  previousStepSize,
                             G4double  currentMinimumStep,
			     G4double& currentSafety,
                             G4GPILSelection* selection
			    );

      virtual G4VParticleChange* AlongStepDoIt(
			     const G4Track& ,
			     const G4Step& 
			    );
 
     //  no operation in  AtRestDoIt
      virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& ,
			     G4ForceCondition* 
			    ) { return -1.0; };

     //  no operation in  AtRestDoIt
      virtual G4VParticleChange* AtRestDoIt(
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

  protected:// with description
    virtual G4double GetContinuousStepLimit(const G4Track& aTrack,
                             G4double  previousStepSize,
                             G4double  currentMinimumStep,
			     G4double& currentSafety
                                                             )=0;
  private:
    // this is the returnd value of  G4GPILSelection in 
    // the arguments of AlongStepGPIL()
    G4GPILSelection  valueGPILSelection;

  protected:// with description
    // these two methods are set/get methods for valueGPILSelection
    void SetGPILSelection(G4GPILSelection selection)
    { valueGPILSelection = selection;};

    G4GPILSelection GetGPILSelection() const{return valueGPILSelection;};

   private:
  // hide default constructor and assignment operator as private 
      G4VContinuousDiscreteProcess();
      G4VContinuousDiscreteProcess & operator=(const G4VContinuousDiscreteProcess &right);
```

<!-- G4VContinuousDiscreteProcess.md ends here -->
