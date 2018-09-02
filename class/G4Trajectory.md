<!-- G4Trajectory.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 12:44:48 2018 (+0800)
;; Last-Updated: 日 9月  2 12:50:11 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4Trajectory

**public G4VTrajectory**


Track does not keep its trace. No track object persists at the end of event.  
G4Trajectory is the class which copies some of G4Track information.  
G4TrajectoryPoint is the class which copies some of G4Step information.  
- G4Trajectory has a vector of G4TrajectoryPoint.
- At the end of event processing, G4Event has a collection of G4Trajectory objects.
	- /tracking/storeTrajectory must be set to 1.
- Keep in mind the distinction.
	- G4Track <--> G4Trajectory, G4Step <--> G4TrajectoryPoint
- Given G4Trajectory and G4TrajectoryPoint objects persist till the end of an event, you should be careful not to store too many trajectories.
	- E.g. avoid for high energy EM shower tracks.
- G4Trajectory and G4TrajectoryPoint store only the minimum information.
	- You can create your own trajectory / trajectory point classes to store information
you need. G4VTrajectory and G4VTrajectoryPoint are base classes. 





This class represents the trajectory of a particle tracked.  
It includes information of 
- 1) List of trajectory points which compose the trajectory,
- 2) static information of particle which generated the trajectory, 
- 3) trackID and parent particle ID of the trajectory,


## class

```cpp
typedef std::vector<G4VTrajectoryPoint*>  TrajectoryPointContainer;
```


```cpp
//--------
public: // with description
//--------

// Constructor/Destrcutor

   G4Trajectory();

   G4Trajectory(const G4Track* aTrack);
   G4Trajectory(G4Trajectory &);
   virtual ~G4Trajectory();

// Operators
   inline void* operator new(size_t);
   inline void  operator delete(void*);
   inline int operator == (const G4Trajectory& right) const
   {return (this==&right);} 

// Get/Set functions 
   inline G4int GetTrackID() const
   { return fTrackID; }
   inline G4int GetParentID() const
   { return fParentID; }
   inline G4String GetParticleName() const
   { return ParticleName; }
   inline G4double GetCharge() const
   { return PDGCharge; }
   inline G4int GetPDGEncoding() const
   { return PDGEncoding; }
   inline G4double GetInitialKineticEnergy() const
   { return initialKineticEnergy; }
   inline G4ThreeVector GetInitialMomentum() const
   { return initialMomentum; }

// Other member functions
   virtual void ShowTrajectory(std::ostream& os=G4cout) const;
   virtual void DrawTrajectory() const;
   virtual void AppendStep(const G4Step* aStep);
   virtual int GetPointEntries() const { return positionRecord->size(); }
   virtual G4VTrajectoryPoint* GetPoint(G4int i) const 
   { return (*positionRecord)[i]; }
   virtual void MergeTrajectory(G4VTrajectory* secondTrajectory);

   G4ParticleDefinition* GetParticleDefinition();

   virtual const std::map<G4String,G4AttDef>* GetAttDefs() const;
   virtual std::vector<G4AttValue>* CreateAttValues() const;

//---------
   private:
//---------

  TrajectoryPointContainer* positionRecord;
  G4int                     fTrackID;
  G4int                     fParentID;
  G4int                     PDGEncoding;
  G4double                  PDGCharge;
  G4String                  ParticleName;
  G4double                  initialKineticEnergy;
  G4ThreeVector             initialMomentum;
```

<!-- G4Trajectory.md ends here -->
