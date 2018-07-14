<!-- G4VParticleChange.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 11:54:39 2018 (+0800)
;; Last-Updated: 六 7月 14 11:56:01 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VParticleChange 


```cpp
//  This class is the abstract class for ParticleChange.
//-
//  The ParticleChange class ontains the results after invocation 
//  of a physics process. This includes final states of parent
//  particle (momentum, energy, etc) and secondary particles generated 
//  by the interaction.
//  The tracking assumes that all the values of energy and
//  momentum are in global reference system, therefore all the
//  needed Lorentz transformations must have been already Done
//  when filling the data-members of this class.
//-
//-
//   This abstract class has following four virtual methods
//     virtual G4Step* UpdateStepForAtRest(G4Step* Step);
//     virtual G4Step* UpdateStepForAlongStep(G4Step* Step);
//     virtual G4Step* UpdateStepForPostStep(G4Step* Step);
//     virtual void Initialize(const G4Track&);
//   The UpdateStep methods return the pointer to the G4Step 
//   after updating the given Step information by using final state 
//   information of the track given by a physics process.    
//   User must add methods to keep the final state information 
//   in his derived class as well as implement UpdateStep methods 
//   which he want to use.
//-
//   The Initialize methods is provided to refresh the final 
//   state information and should be called by each process 
//   at the beginning of DoIt.
```

## class

```cpp
  public:
    // default constructor
    G4VParticleChange();

    // destructor
    virtual ~G4VParticleChange();

    // equal/unequal operator
    G4bool operator==(const G4VParticleChange &right) const;
    G4bool operator!=(const G4VParticleChange &right) const;
    // "equal" means that teo objects have the same pointer.

  protected:
    // hide copy constructor and assignment operaor as protected
    G4VParticleChange(const G4VParticleChange &right);
    G4VParticleChange & operator=(const G4VParticleChange &right);
 
  public: // with description
    // --- the following methods are for updating G4Step -----   
    virtual G4Step* UpdateStepForAtRest(G4Step* Step);
    virtual G4Step* UpdateStepForAlongStep(G4Step* Step);
    virtual G4Step* UpdateStepForPostStep(G4Step* Step);
    // Return the pointer to the G4Step after updating the Step information
    // by using final state information of the track given by a physics
    // process    
 
  protected: // with description
    G4Step* UpdateStepInfo(G4Step* Step);
    //  Update the G4Step specific attributes 
    //  (i.e. SteppingControl, LocalEnergyDeposit, and TrueStepLength)


  public: // with description
    virtual void Initialize(const G4Track&);
    // This methods will be called by each process at the beginning of DoIt
    // if necessary.

  protected:
    void InitializeTrueStepLength(const G4Track&);
    void InitializeLocalEnergyDeposit(const G4Track&);
    void InitializeSteppingControl(const G4Track&);
    void InitializeParentWeight(const G4Track&);
    void InitializeParentGlobalTime(const G4Track&);

    void InitializeStatusChange(const G4Track&);
    void InitializeSecondaries(const G4Track&);
    void InitializeStepInVolumeFlags(const G4Track&);
   // ------------------------------------------------------   
 
  public: // with description
    //---- the following methods are for TruePathLength ----
    G4double GetTrueStepLength() const;
    void  ProposeTrueStepLength(G4double truePathLength);
    //  Get/Propose theTrueStepLength

    //---- the following methods are for LocalEnergyDeposit ----   
    G4double GetLocalEnergyDeposit() const;
    void ProposeLocalEnergyDeposit(G4double anEnergyPart);
    //  Get/Propose the locally deposited energy 
 
    //---- the following methods are for nonIonizingEnergyDeposit  ----   
    G4double GetNonIonizingEnergyDeposit() const;
    void ProposeNonIonizingEnergyDeposit(G4double anEnergyPart);
    //  Get/Propose the non-ionizing deposited energy 

    //---- the following methods are for TrackStatus -----   
    G4TrackStatus GetTrackStatus() const;
    void ProposeTrackStatus(G4TrackStatus status); 
    //  Get/Propose the final TrackStatus of the current particle.
    // ------------------------------------------------------   

    //---- the following methods are for managements of SteppingControl --
    G4SteppingControl GetSteppingControl() const;
    void ProposeSteppingControl(G4SteppingControl StepControlFlag);
    //  Set/Propose a flag to control stepping manager behavier 
    // ------------------------------------------------------   
 
    //---- the following methods are for managements of initial/last step
    G4bool GetFirstStepInVolume() const;
    G4bool GetLastStepInVolume() const;
    void   ProposeFirstStepInVolume(G4bool flag);
    void   ProposeLastStepInVolume(G4bool flag);

    //---- the following methods are for managements of secondaries --
    void Clear();
    //  Clear the contents of this objects 
    //  This method should be called after the Tracking(Stepping) 
    //  manager removes all secondaries in theListOfSecondaries 

    void SetNumberOfSecondaries(G4int totSecondaries);
    //  SetNumberOfSecondaries must be called just before AddSecondary()
    //  in order to secure memory space for theListOfSecondaries 
    //  This method resets theNumberOfSecondaries to 0
    //  (that will be incremented at every AddSecondary() call).

    G4int GetNumberOfSecondaries() const;
    //  Returns the number of secondaries current stored in
    //  G4TrackFastVector.

    G4Track* GetSecondary(G4int anIndex) const;
    //  Returns the pointer to the generated secondary particle
    //  which is specified by an Index.

    void AddSecondary(G4Track* aSecondary);
    //  Add a secondary particle to theListOfSecondaries.
    // ------------------------------------------------------   

    G4double GetWeight() const;
    G4double GetParentWeight() const ;
    //  Get weight of the parent (i.e. current) track
    void ProposeWeight(G4double finalWeight);
    void ProposeParentWeight(G4double finalWeight);
    //  Propse new weight of the parent (i.e. current) track
    //  As for AlongStepDoIt, the parent weight will be set 
    //  in accumulated manner
    //  i.e.) If two processes propose weight of W1 and W2 respectively
    //  for the track with initial weight of W0 
    //  the final weight is set to
    //  (W1/W0) * (W2/W0) * W0  
  
    void     SetSecondaryWeightByProcess(G4bool);
    G4bool   IsSecondaryWeightSetByProcess() const;  
    // In default (fSecondaryWeightByProcess flag is false), 
    // the weight of secondary tracks will be set to 
    // the parent weight
    // If fSecondaryWeightByProcess flag is true, 
    // the weight of secondary tracks will not be changed 
    // by the ParticleChange
    // (i.e. the process determine the secodary weight)
    // NOTE: 
    // Make sure that only one processe in AlongStepDoIt 
    // proposes the parent weight, 
    // If several processes in AlongStepDoIt proposes 
    // the parent weight and add secondaties with 
    // fSecondaryWeightByProcess is set to false, 
    // secondary weights may be wrong

    void   SetParentWeightByProcess(G4bool);
    G4bool   IsParentWeightSetByProcess() const;  
    // Obsolete

    virtual void DumpInfo() const;
    //  Print out information

    void SetVerboseLevel(G4int vLevel);
    G4int GetVerboseLevel() const;



  public: // with description
    // CheckIt method is provided for debug
    virtual G4bool CheckIt(const G4Track&);
 
    // CheckIt method is activated 
    // if debug flag is set and 'G4VERBOSE' is defined 
    void   ClearDebugFlag();
    void   SetDebugFlag();
    G4bool GetDebugFlag() const; 

  protected:
    // CheckSecondary method is provided for debug
    G4bool CheckSecondary(G4Track&);
 
    G4double GetAccuracyForWarning() const;
    G4double GetAccuracyForException() const;
```


<!-- G4VParticleChange.md ends here -->
