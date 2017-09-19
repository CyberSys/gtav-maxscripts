rollout PropsUtilityGUI "Props Replacement Utility" width:150 height:200
	(	
		group "Utility"
		(
			button 'btn_center' "Center Pivot to Children" width:130 align:#center
			button 'btn_reset2' "Pos and Rot to Parent" width:130 align:#center
			button 'btn_reset1' "Pivot to Parent" width:130 align:#center
			button 'btn_centerbottom' "Center Pivot to Bottom" width:130 align:#center
			button 'btn_reset3' "Position to Parent" width:130 align:#center
		)			
		on btn_center pressed do
		(
			for i in selection do
				(	
					if(i.children.count > 0) then
					(
						children_center = [0,0,0]
						for b in i.children do
						(
						children_center = children_center + b.center
						)
						children_center = children_center/i.children.count
						i.pivot = children_center
						i.children.pivot = children_center
					)else messagebox (i.name + " hasn't any child.")
				)
		)
		
		on btn_reset1 pressed do
		(
			for i in selection do
			(
				if(i.parent != undefined) then
				(
				i.pivot = i.parent.pivot
				)else messagebox (i.name+" has no parent.")
			)
		)
		
		on btn_reset2 pressed do
		(
			for i in selection do
			(
				if(i.parent != undefined) then
				(
				i.pos = i.parent.pos
				i.rotation = i.parent.rotation
				)else messagebox (i.name+" has no parent.")
			)
		)
		
		on btn_reset3 pressed do
		(
			for i in selection do
			(
				if(i.parent != undefined) then
				(
				i.pos = i.parent.pos
				)else messagebox (i.name+" has no parent.")
			)
		)
		
		on btn_centerbottom pressed do
		(
			for i in selection do
			(
				i.pivot = i.center
				i.pivot.z = i.min.z
			)
		)
	)
	createdialog PropsUtilityGUI