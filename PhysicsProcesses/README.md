<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:18:14 2017 (+0800)
;; Last-Updated: 四 7月 12 08:34:58 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 5
;; URL: http://wuhongyi.cn -->

# README

> http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#
> http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/PhysicsReferenceManual/html/index.html


Number of reference Physics Lists is not small, because there are many alternative physics models in the toolkit applicable for simulation of very different problems. Reference Physics Lists are available in GEANT4 physics_list sub-library. All these classes inherit from virtual interface G4VModularPhysicsList (which is an extention of the base class G4VUserPhysicsList. The advantages of the modular design are in maintenence of modules by different GEANT4 working groups, independent development of particular modules, possibility for combining of various modules (following G4VPhysicsConstructor interface) in reference Physics Lists and in user custom Physics Lists. There are following types of modules:

- electromagnetic physics;
- extra physics processes for gamma and leptons;
- decay;
- hadron elastic;
- hadron inelastic;
- stopping particles capture processes;
- ion nuclear interactions;
- step limiters;
- others.

----


The generalization and abstraction of physics processes is a key issue in the design of Geant4. All physics processes are treated in the same manner from the tracking point of view. The Geant4 approach enables anyone to create a process and assign it to a particle type. This openness should allow the creation of processes for novel, domain-specific or customised purposes by individuals or groups of users.

Each process has two groups of methods which play an important role in tracking, GetPhysicalInteractionLength (GPIL) and DoIt. **The GPIL method gives the step length from the current space-time point to the next space-time point. It does this by calculating the probability of interaction based on the process’s cross section information. At the end of this step the DoIt method should be invoked. The DoIt method implements the details of the interaction, changing the particle’s energy, momentum, direction and position, and producing secondary tracks if required.** These changes are recorded as G4VParticleChange objects (see Particle change).





<!-- README.md ends here -->
