package com.sekolah.siswaservice.Service;

import com.sekolah.siswaservice.Model.Siswa;
import com.sekolah.siswaservice.Repository.SiswaRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SiswaService {
    @Autowired
    private SiswaRepository siswaRepository;

    public List<Siswa> getAllSiswa() {
        return siswaRepository.findAll();
    }

    public Siswa getSiswaById(Long id) {
        return siswaRepository.findById(id).orElse(null);
    }

    public Siswa createSiswa(Siswa siswa) {
        return siswaRepository.save(siswa);
    }

    public Siswa updateSiswa(Long id, Siswa updatedSiswa) {
        Siswa existingSiswa = getSiswaById(id);
        if (existingSiswa != null) {
            existingSiswa.setNama(updatedSiswa.getNama());
            existingSiswa.setJenisKelamin(updatedSiswa.getJenisKelamin());
            existingSiswa.setAlamat(updatedSiswa.getAlamat());
            return siswaRepository.save(existingSiswa);
        }
        return null;
    }

    public Siswa deleteSiswa(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID siswa tidak boleh null.");
        }
        Optional<Siswa> optionalSiswa = siswaRepository.findById(id);
        if (optionalSiswa.isPresent()) {
            siswaRepository.delete(optionalSiswa.get());
            return optionalSiswa.get();
        } else {
            throw new EntityNotFoundException("guru dengan ID " + id + " tidak ditemukan.");
        }
    }
}
