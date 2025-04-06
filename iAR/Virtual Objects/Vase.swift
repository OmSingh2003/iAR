//
//  Created by Om Singh
//  GitHub: https://github.com/OmSingh2003
//
//  This file is part of the iAR project.
//  © 2025 Om Singh. All rights reserved.

import Foundation

class Vase: VirtualObject {

	override init() {
		super.init(modelName: "vase", fileExtension: "scn", thumbImageFilename: "vase", title: "Vase")
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
