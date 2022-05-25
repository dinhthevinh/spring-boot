package com.laptrinhjavaweb.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.model.BuildingModel;
import com.laptrinhjavaweb.model.response.BuildingSearchResponse;
import com.laptrinhjavaweb.service.BuildingService;

//@Controller
@RestController
@RequestMapping("/api/building")
public class BuildingAPI {
	
	@Autowired
	private BuildingService buildingService;

//	@RequestMapping(method = RequestMethod.GET)
	
	@GetMapping
	public List<BuildingSearchResponse> findAll(@RequestParam Map<String, Object> requestParams,@RequestParam(value = "types", required = false) List<String> types  ) {	
		List<BuildingSearchResponse> resutls = buildingService.findAll(requestParams, types);
		return resutls;	
	}



//	@RequestMapping(method = RequestMethod.POST)
	@PostMapping
	public BuildingModel insertBuilding(@RequestBody BuildingModel newBuilding) {
		BuildingModel resutl = new BuildingModel();
		return resutl;
	}

//	@RequestMapping( method = RequestMethod.PUT)
	@PutMapping
	public BuildingModel updateBuilding(@RequestBody BuildingModel updateBuilding) {
		BuildingModel resutl = new BuildingModel();
		return resutl;
	}

//	@RequestMapping(value ="/{buildingid}", method = RequestMethod.GET)
	@GetMapping("/{buildingid}")
	public BuildingModel getBuildingDetail(@PathVariable("buildingid") Long id) {
		BuildingModel resutl = new BuildingModel();
		return resutl;
	}
}
