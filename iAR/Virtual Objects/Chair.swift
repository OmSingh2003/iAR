//
//  Created by Om Singh
//  GitHub: https://github.com/OmSingh2003
//
//  This file is part of the iAR project.
//  © 2025 Om Singh. All rights reserved.

import Foundation

class Chair: VirtualObject {

	override init() {
		super.init(modelName: "chair", fileExtension: "scn", thumbImageFilename: "chair", title: "Chair")
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
