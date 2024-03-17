package com.sekolah.mapelservice.Service;

import com.sekolah.mapelservice.Model.MataPelajaran;
import com.sekolah.mapelservice.Repository.MataPelajaranRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Optional;

@Service
public class MataPelajaranService {

    @Autowired
    private MataPelajaranRepository mataPelajaranRepository;


    public List<MataPelajaran> getAllMataPelajaran() {
        return mataPelajaranRepository.findAll();
    }

    public Optional<MataPelajaran> getMataPelajaranById(Long id) {
        return mataPelajaranRepository.findById(id);
    }

    public MataPelajaran createMataPelajaran(MataPelajaran mataPelajaran) {
        return mataPelajaranRepository.save(mataPelajaran);
    }

    public MataPelajaran updateMataPelajaran(Long id, MataPelajaran updatedMataPelajaran) {
        Optional<MataPelajaran> optionalMataPelajaran = mataPelajaranRepository.findById(id);
        if (optionalMataPelajaran.isPresent()) {
            MataPelajaran mataPelajaran = optionalMataPelajaran.get();
            mataPelajaran.setNama(updatedMataPelajaran.getNama());
            mataPelajaran.setDeskripsi(updatedMataPelajaran.getDeskripsi());
            return mataPelajaranRepository.save(mataPelajaran);
        } else {
            throw new RuntimeException("Mata pelajaran not found");
        }
    }

    public MataPelajaran deleteMataPelajaran(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID Mata Pelajaran tidak boleh null.");
        }
        Optional<MataPelajaran> optionalMataPelajaran = mataPelajaranRepository.findById(id);
        if (optionalMataPelajaran.isPresent()) {
            mataPelajaranRepository.delete(optionalMataPelajaran.get());
            return optionalMataPelajaran.get();
        } else {
            throw new EntityNotFoundException("MataPelajaran dengan ID " + id + " tidak ditemukan.");
        }
    }
}
