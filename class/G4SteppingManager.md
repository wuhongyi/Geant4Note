<!-- G4SteppingManager.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 07:07:13 2018 (+0800)
;; Last-Updated: 二 8月  7 07:09:25 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4SteppingManager

This is the class which plays an essential role in tracking the particle. It takes cares all message passing between objects in the different categories (for example, geometry(including transportation), interactions in matter, etc). It's public method 'stepping' steers to step the particle.

Geant4 kernel use only

## class

```cpp
   typedef std::vector<G4int> 
             G4SelectedAtRestDoItVector;
   typedef std::vector<G4int> 
             G4SelectedAlongStepDoItVector;
   typedef std::vector<G4int>
             G4SelectedPostStepDoItVector;

   static const size_t SizeOfSelectedDoItVector=100;
     // In global scope for porting on WIN-VC compiler...
```



```cpp
// G4SteppingManager


//--------
public: //without description
//--------

// Constructor/Destructor

   G4SteppingManager();
      // SteppingManger should be dynamically persistent, therefore 
      // you need to invoke new() when you call this constructor.
      // "Secodary track vector" will be dynamically created by this 
      // cosntructor. "G4UserSteppingAction" will be also constructed 
      // in this constructor, and "this" pointer will be passed to 
      // "G4UserSteppingAction". 

   ~G4SteppingManager();

// Get/Set functions

   const G4TrackVector* GetSecondary() const;
   void SetUserAction(G4UserSteppingAction* apAction);
   G4Track* GetTrack() const;
   void SetVerboseLevel(G4int vLevel);
   void SetVerbose(G4VSteppingVerbose*);
   G4Step* GetStep() const;
   void SetNavigator(G4Navigator* value);


// Other member functions

   G4StepStatus Stepping();
      // Steers to move the give particle from the TrackingManger 
      // by one Step.

  void SetInitialStep(G4Track* valueTrack);
     // Sets up initial track information (enegry, position, etc) to 
     // the PreStepPoint of the G4Step. This funciton has to be called 
     // just once before the stepping loop in the "TrackingManager".

  void GetProcessNumber();

// Get methods
   G4double GetPhysicalStep();
   G4double GetGeometricalStep();
   G4double GetCorrectedStep();
   G4bool GetPreStepPointIsGeom();
   G4bool GetFirstStep();
   G4StepStatus GetfStepStatus();
   G4double GetTempInitVelocity();
   G4double GetTempVelocity();
   G4double GetMass();
   G4double GetsumEnergyChange();
   G4VParticleChange* GetfParticleChange();
   G4Track* GetfTrack();
   G4TrackVector* GetfSecondary();
   G4Step* GetfStep();
   G4StepPoint* GetfPreStepPoint();
   G4StepPoint* GetfPostStepPoint();
   G4VPhysicalVolume* GetfCurrentVolume();
   G4VSensitiveDetector* GetfSensitive();
   G4VProcess* GetfCurrentProcess();
   G4ProcessVector* GetfAtRestDoItVector();
   G4ProcessVector* GetfAlongStepDoItVector();
   G4ProcessVector* GetfPostStepDoItVector();
   G4ProcessVector* GetfAlongStepGetPhysIntVector();
   G4ProcessVector* GetfPostStepGetPhysIntVector();
   G4ProcessVector* GetfAtRestGetPhysIntVector();
   G4double GetcurrentMinimumStep();
   G4double GetnumberOfInteractionLengthLeft();
   size_t GetfAtRestDoItProcTriggered();
   size_t GetfAlongStepDoItProcTriggered();
   size_t GetfPostStepDoItProcTriggered();
   G4int GetfN2ndariesAtRestDoIt();
   G4int GetfN2ndariesAlongStepDoIt();
   G4int GetfN2ndariesPostStepDoIt();
   G4Navigator* GetfNavigator();
   G4int GetverboseLevel();
   size_t GetMAXofAtRestLoops();
   size_t GetMAXofAlongStepLoops();
   size_t GetMAXofPostStepLoops();
   G4SelectedAtRestDoItVector* GetfSelectedAtRestDoItVector();
   G4SelectedAlongStepDoItVector* GetfSelectedAlongStepDoItVector();
   G4SelectedPostStepDoItVector* GetfSelectedPostStepDoItVector();
   G4double   GetfPreviousStepSize();
   const G4TouchableHandle& GetTouchableHandle();
   G4SteppingControl GetStepControlFlag();
   G4UserSteppingAction* GetUserAction();
   G4double GetphysIntLength();
   G4ForceCondition GetfCondition();
   G4GPILSelection  GetfGPILSelection();
  //
   G4bool KillVerbose;
//---------   
   private:
//---------   

// Member functions

   void DefinePhysicalStepLength();
      // Calculate corresponding physical length from the mean free path 
      // left for each discrete phyiscs process. The minimum allowable
      // Step for each continious process will be also calculated.
   void InvokeAtRestDoItProcs();
   void InvokeAlongStepDoItProcs();
   void InvokePostStepDoItProcs();
   void InvokePSDIP(size_t); // 
   G4double CalculateSafety();
      // Return the estimated safety value at the PostStepPoint
   void ApplyProductionCut(G4Track*);

// Member data 
   
   G4UserSteppingAction* fUserSteppingAction;

   G4VSteppingVerbose* fVerbose;

   G4double PhysicalStep;
   G4double GeometricalStep;
   G4double CorrectedStep;
   G4bool PreStepPointIsGeom;
   G4bool FirstStep;
   G4StepStatus fStepStatus;

   G4double TempInitVelocity;
   G4double TempVelocity;
   G4double Mass;

   G4double sumEnergyChange;

   G4VParticleChange* fParticleChange;
   G4Track* fTrack;
   G4TrackVector* fSecondary;
   G4Step* fStep;
   G4StepPoint* fPreStepPoint;
   G4StepPoint* fPostStepPoint;

   G4VPhysicalVolume* fCurrentVolume;
   G4VSensitiveDetector* fSensitive;
   G4VProcess* fCurrentProcess;
      // The pointer to the process of which DoIt or
      // GetPhysicalInteractionLength has been just executed.


   G4ProcessVector* fAtRestDoItVector;
   G4ProcessVector* fAlongStepDoItVector;
   G4ProcessVector* fPostStepDoItVector;

   G4ProcessVector* fAtRestGetPhysIntVector;
   G4ProcessVector* fAlongStepGetPhysIntVector;
   G4ProcessVector* fPostStepGetPhysIntVector;

   size_t MAXofAtRestLoops;
   size_t MAXofAlongStepLoops;
   size_t MAXofPostStepLoops;

   size_t fAtRestDoItProcTriggered;
   size_t fAlongStepDoItProcTriggered;
   size_t fPostStepDoItProcTriggered;

   G4int fN2ndariesAtRestDoIt;
   G4int fN2ndariesAlongStepDoIt;
   G4int fN2ndariesPostStepDoIt;
      // These are the numbers of secondaries generated by the process
      // just executed.

   G4Navigator *fNavigator;

   G4int verboseLevel;

   G4SelectedAtRestDoItVector* fSelectedAtRestDoItVector;
   G4SelectedAlongStepDoItVector* fSelectedAlongStepDoItVector;
   G4SelectedPostStepDoItVector* fSelectedPostStepDoItVector;

   G4double   fPreviousStepSize;

   G4TouchableHandle fTouchableHandle;

   G4SteppingControl StepControlFlag;

   G4double kCarTolerance;
      // Cached geometrical tolerance on surface
   G4double proposedSafety;
      // This keeps the minimum safety value proposed by AlongStepGPILs.
   G4ThreeVector endpointSafOrigin;
   G4double endpointSafety;
      // To get the true safety value at the PostStepPoint, you have
      // to subtract the distance to 'endpointSafOrigin' from this value.
   G4double physIntLength;
   G4ForceCondition fCondition;
   G4GPILSelection  fGPILSelection;
      // Above three variables are for the method 
      // DefinePhysicalStepLength(). To pass these information to
      // the method Verbose, they are kept at here. Need a more 
      // elegant mechanism.
```

<!-- G4SteppingManager.md ends here -->
