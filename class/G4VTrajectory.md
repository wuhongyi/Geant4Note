<!-- G4VTrajectory.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 12:42:15 2018 (+0800)
;; Last-Updated: 日 9月  2 12:43:57 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VTrajectory

This class is the abstract base class which represents a trajectory of a particle tracked.  
Its concrete class includes information of 
- 1) List of trajectory points which compose the trajectory,
- 2) static information of particle which generated the trajectory, 
- 3) trackID and parent particle ID of the trajectory,



## class

```cpp
 public: // with description

// Constructor/Destrcutor

   G4VTrajectory();
   virtual ~G4VTrajectory();

// Operators
   G4bool operator == (const G4VTrajectory& right) const;

// Get/Set functions 
   virtual G4int GetTrackID() const = 0;
   virtual G4int GetParentID() const = 0;
   virtual G4String GetParticleName() const = 0;
   virtual G4double GetCharge() const = 0;
   // Charge is that of G4DynamicParticle
   virtual G4int GetPDGEncoding() const = 0;
   // Zero will be returned if the particle does not have PDG code.
   virtual G4ThreeVector GetInitialMomentum() const = 0;
   // Momentum at the origin of the track in global coordinate system.

// Other member functions
   virtual int GetPointEntries() const = 0;
   // Returns the number of trajectory points
   virtual G4VTrajectoryPoint* GetPoint(G4int i) const = 0;
   // Returns i-th trajectory point.
   virtual void ShowTrajectory(std::ostream& os=G4cout) const;
   // Convert attributes in trajectory (and trajectory point if
   // needed) to ostream.  A default implementation in this base class
   // may be used or may be overridden in the concrete class.  Note:
   // the user needs to follow with new-line or end-of-string,
   // depending on the nature of os.
   virtual void DrawTrajectory() const;
   // Draw the trajectory.  A default implementation in this base
   // class may be used or may be overridden in the concrete class.
   virtual const std::map<G4String,G4AttDef>* GetAttDefs() const
   { return 0; }
   // If implemented by a derived class, returns a pointer to a map of
   // attribute definitions for the attribute values below.  The user
   // must test the validity of this pointer.  See G4Trajectory for an
   // example of a concrete implementation of this method.
   virtual std::vector<G4AttValue>* CreateAttValues() const
   { return 0; }
   // If implemented by a derived class, returns a pointer to a list
   // of attribute values suitable, e.g., for picking.  Each must
   // refer to an attribute definition in the above map; its name is
   // the key.  The user must test the validity of this pointer (it
   // must be non-zero and conform to the G4AttDefs, which may be
   // checked with G4AttCheck) and delete the list after use.  See
   // G4Trajectory for an example of a concrete implementation of this
   // method and G4VTrajectory::ShowTrajectory for an example of its
   // use.

 public:
   // Following methods MUST be invoked exclusively by G4TrackingManager
   virtual void AppendStep(const G4Step* aStep) = 0;
   virtual void MergeTrajectory(G4VTrajectory* secondTrajectory) = 0;
```

<!-- G4VTrajectory.md ends here -->
