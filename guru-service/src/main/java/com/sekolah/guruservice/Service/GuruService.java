package com.sekolah.guruservice.Service;

import com.sekolah.guruservice.Model.Guru;
import com.sekolah.guruservice.Repository.GuruRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GuruService {
    @Autowired
    private GuruRepository guruRepository;

    public List<Guru> getAllGuru() {
        return guruRepository.findAll();
    }

    public Optional<Guru> getGuruById(Long id) {
        return guruRepository.findById(id);
    }

    public Guru createGuru(Guru guru) {
        return guruRepository.save(guru);
    }

    public Guru updateGuru(Long id, Guru updatedGuru) {
        Optional<Guru> optionalGuru = guruRepository.findById(id);
        if (optionalGuru.isPresent()) {
            Guru guru = optionalGuru.get();
            guru.setNama(updatedGuru.getNama());
            guru.setNip(updatedGuru.getNip());
            return guruRepository.save(guru);
        } else {
            throw new RuntimeException("Guru not found");
        }
    }

    public Guru deleteGuru(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID guru tidak boleh null.");
        }
        Optional<Guru> optionalGuru = guruRepository.findById(id);
        if (optionalGuru.isPresent()) {
            guruRepository.delete(optionalGuru.get());
            return optionalGuru.get();
        } else {
            throw new EntityNotFoundException("guru dengan ID " + id + " tidak ditemukan.");
        }
    }
}
