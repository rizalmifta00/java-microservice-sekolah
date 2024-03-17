package com.sekolah.kelasservice.Controller;

import com.sekolah.kelasservice.Model.Kelas;
import com.sekolah.kelasservice.Service.KelasService;
import com.sekolah.kelasservice.Util.BaseResponse;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/kelas")
public class KelasController {

    @Autowired
    private KelasService kelasService;
    @GetMapping("/")
    public ResponseEntity<BaseResponse<List<Kelas>>> getAllKelas() {
        try {
            List<Kelas> kelasList = kelasService.getAllKelas();
            BaseResponse<List<Kelas>> response = new BaseResponse<>("success", "Data retrieved successfully", kelasList);
            return new ResponseEntity<>(response, HttpStatus.OK);
        }catch (Exception e){
            BaseResponse<List<Kelas>> response = new BaseResponse<>("error", "Failed to retrieve data", null);
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @GetMapping("/{id}")
    public ResponseEntity<BaseResponse<Kelas>> getKelasById(@PathVariable Long id) {
        try {
            Kelas kelas = kelasService.getKelasById(id);
            if (kelas != null) {
                BaseResponse<Kelas> response = new BaseResponse<>("success", "Data retrieved successfully", kelas);
                return new ResponseEntity<>(response, HttpStatus.OK);
            } else {
                BaseResponse<Kelas> response = new BaseResponse<>("error", "Siswa not found", null);
                return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            BaseResponse<Kelas> response = new BaseResponse<>("error", "Failed to retrieve data", null);
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/")
    public ResponseEntity<BaseResponse<Kelas>> createKelas(@RequestBody Kelas kelas) {
        try {
            Kelas createdKelas = kelasService.createKelas(kelas);
            BaseResponse<Kelas> response = new BaseResponse<>("success", "Kelas created successfully", createdKelas);
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (Exception e) {
            BaseResponse<Kelas> response = new BaseResponse<>("error", "Failed to create kelas", null);
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<BaseResponse<Kelas>> updateKelas(@PathVariable Long id, @RequestBody Kelas kelas) {
        try {
            Kelas updatedKelas = kelasService.updateKelas(id, kelas);
            BaseResponse<Kelas> response = new BaseResponse<>("success", "Kelas updated successfully", updatedKelas);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (RuntimeException e) {
            BaseResponse<Kelas> response = new BaseResponse<>("error", "Kelas not found", null);
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<BaseResponse<Kelas>> deleteKelas(@PathVariable Long id) {
        try {
            Kelas deletedKelas = kelasService.deleteKelas(id);
            BaseResponse<Kelas> response = new BaseResponse<>("success", "Kelas deleted successfully", deletedKelas);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (EntityNotFoundException ex) {
            BaseResponse<Kelas> response = new BaseResponse<>("error", ex.getMessage(), null);
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }
}
