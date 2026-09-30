{
  rsf_filetype = ''
    vim.filetype.add({
      pattern = {
        ['.*\.rsf'] = 'rsf',
        ['ReelSetup.*'] = 'rsf',
      },
    })
  '';
}
