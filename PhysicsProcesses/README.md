<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:18:14 2017 (+0800)
;; Last-Updated: 三 1月 31 22:22:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 4
;; URL: http://wuhongyi.cn -->

# README

> http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#
> http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/PhysicsReferenceManual/html/index.html


Number of reference Physics Lists is not small, because there are many alternative physics models in the toolkit applicable for simulation of very different problems. Reference Physics Lists are available in G EANT 4 physics_list sub-library. All these classes inherit from virtual interface G4VModularPhysicsList (which is an extention of the base class G4VUserPhysicsList. The advantages of the modular design are in maintenence of modules by different G EANT 4 working groups, independent development of particular modules, possibility for combining of various modules (following G4VPhysicsConstructor interface) in reference Physics Lists and in user custom Physics Lists. There are following types of modules:

- electromagnetic physics;
- extra physics processes for gamma and leptons;
- decay;
- hadron elastic;
- hadron inelastic;
- stopping particles capture processes;
- ion nuclear interactions;
- step limiters;
- others.




<!-- README.md ends here -->
