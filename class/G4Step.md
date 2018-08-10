<!-- G4Step.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 08:21:29 2018 (+0800)
;; Last-Updated: 五 8月 10 08:22:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4Step

This class represents the Step of a particle tracked.
It includes information of 
 1) List of Step points which compose the Step,
 2) static information of particle which generated the Step, 
 3) trackID and parent particle ID of the Step,
 4) termination condition of the Step,

## class

```cpp
//--------
   public:

// Constructor/Destrcutor
   G4Step();
   ~G4Step();

// Copy Counstructor and assignment operator
   G4Step(const G4Step& );
   G4Step & operator=(const G4Step &);   

//--------
   public: // WIth description

// Get/Set functions 
   // currnet track
   G4Track* GetTrack() const;
   void SetTrack(G4Track* value);

   // step points 
   G4StepPoint* GetPreStepPoint() const;
   void SetPreStepPoint(G4StepPoint* value);

   G4StepPoint* GetPostStepPoint() const;
   void SetPostStepPoint(G4StepPoint* value);

   // step length
   G4double GetStepLength() const;
   void SetStepLength(G4double value);
    // Before the end of the AlongStepDoIt loop,StepLength keeps
    // the initial value which is determined by the shortest geometrical Step
    // proposed by a physics process. After finishing the AlongStepDoIt,
    // it will be set equal to 'StepLength' in G4Step. 

   // total energy deposit 
   G4double GetTotalEnergyDeposit() const;
   void SetTotalEnergyDeposit(G4double value);

   // total non-ionizing energy deposit 
   G4double GetNonIonizingEnergyDeposit() const;
   void SetNonIonizingEnergyDeposit(G4double value);

   // cotrole flag for stepping
   G4SteppingControl GetControlFlag() const;
   void SetControlFlag(G4SteppingControl StepControlFlag);

    // manipulation of total energy deposit 
   void AddTotalEnergyDeposit(G4double value);
   void ResetTotalEnergyDeposit();

   // manipulation of non-ionizng energy deposit 
   void AddNonIonizingEnergyDeposit(G4double value);
   void ResetNonIonizingEnergyDeposit();


  // Get/Set/Clear flag for initial/last step
   // NOTE:  following flags are not used 
   //        will be ready in later release
   G4bool IsFirstStepInVolume() const;
   G4bool IsLastStepInVolume() const;

   void SetFirstStepFlag();
   void ClearFirstStepFlag();
   void SetLastStepFlag();
   void ClearLastStepFlag();

  // difference of position, time, momentum and energy
   G4ThreeVector GetDeltaPosition() const;
   G4double GetDeltaTime() const;

  // These methods will be deleted 
  // NOTE: use  GetTotalEnergyDeposit() to obtain 
  //       energy loss in the material 
  // 
   G4ThreeVector GetDeltaMomentum() const;
   G4double GetDeltaEnergy() const;


// Other member functions
   void InitializeStep( G4Track* aValue );
   // initiaize contents of G4Step

   void UpdateTrack( );
   // update track by using G4Step information

   void CopyPostToPreStepPoint( );
   // copy PostStepPoint to PreStepPoint 
  
   G4Polyline* CreatePolyline () const;
   // for visualization

//-----------
   protected:
//-----------

// Member data
   G4double fTotalEnergyDeposit;
     // Accummulated total energy desposit in the current Step

   G4double fNonIonizingEnergyDeposit;
     // Accummulated non-ionizing energy desposit in the current Step

//---------
   private:
//---------

// Member data
   G4StepPoint* fpPreStepPoint;
   G4StepPoint* fpPostStepPoint;
   G4double fStepLength;
     // Step length which may be updated at each invocation of 
     // AlongStepDoIt and PostStepDoIt
   G4Track* fpTrack;
     //
   G4SteppingControl fpSteppingControlFlag;     
    // A flag to control SteppingManager behavier from process

  // flag for initial/last step
   G4bool fFirstStepInVolume;
   G4bool fLastStepInVolume;

// Secondary buckets
public:
  // secodaries in the current step
   G4int GetNumberOfSecondariesInCurrentStep() const;

   const std::vector<const G4Track*>* GetSecondaryInCurrentStep() const; 

   // NOTE: Secondary bucket of the Step contains  
   //       all secondaries during tracking the current track 
   //       (i.e. NOT secondaries produced in the current step)
   // all following methods give same object (i.e. G4TrackVector  )
   // but 2nd one will create bucket in addition  
   const G4TrackVector* GetSecondary() const ;
   G4TrackVector* GetfSecondary();
   G4TrackVector* NewSecondaryVector();

   // just delete secondary bucket
   //  NOTE: G4Track objects inside the bucket are not deleted 
   void DeleteSecondaryVector();

   // Add secondary tracks to the bucket 
   void SetSecondary( G4TrackVector* value);

private: 
   // Secondaty bucket implemented by using  std::vector of G4Track*   
   G4TrackVector* fSecondary;

   // number of secondaries which have been created by the last step
   G4int  nSecondaryByLastStep;

   typedef const G4Track* CT;
   std::vector<CT>* secondaryInCurrentStep;

  // Prototyping implementation of smooth representation of curved
  // trajectories. (jacek 30/10/2002)
public:
  // Auxiliary points are ThreeVectors for now; change to
  // G4VAuxiliaryPoints or some such (jacek 30/10/2002)
  void SetPointerToVectorOfAuxiliaryPoints( std::vector<G4ThreeVector>* theNewVectorPointer ) {
    fpVectorOfAuxiliaryPointsPointer = theNewVectorPointer;
  }
  std::vector<G4ThreeVector>* GetPointerToVectorOfAuxiliaryPoints() const {
    return fpVectorOfAuxiliaryPointsPointer;
  }
private:
  // Explicity including the word "Pointer" in the name as I keep
  // forgetting the * (jacek 30/10/2002)
  std::vector<G4ThreeVector>* fpVectorOfAuxiliaryPointsPointer;
```

<!-- G4Step.md ends here -->
